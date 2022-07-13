new_brick_hardened = setmetatable({}, {
    __call = function(self, params)
        local brick = new_brick({
            offset_x = params.offset_x,
            offset_y = params.offset_y,
            x = params.x,
            y = params.y,
            w = params.w,
            h = params.h,
            _weakened = false,
        })
        return setmetatable(brick, { __index = self })
    end
})

function new_brick_hardened:draw()
    if self._weakened then
        spr(u.sprites.bricks.tile_hardened_weakened,
            self._offset_x + self.x,
            self._offset_y + self.y,
            self.w / u.tile_edge_length,
            self.h / u.tile_edge_length)
    else
        spr(u.sprites.bricks.tile_hardened_initial,
            self._offset_x + self.x,
            self._offset_y + self.y,
            self.w / u.tile_edge_length,
            self.h / u.tile_edge_length)
    end
end

function new_brick_hardened:hit_by_ball()
    if self._weakened then
        self.visible = false
    else
        self._weakened = true
    end
end
