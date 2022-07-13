new_brick_regular = setmetatable({}, {
    __call = function(self, params)
        local brick = new_brick({
            offset_x = params.offset_x,
            offset_y = params.offset_y,
            x = params.x,
            y = params.y,
            w = params.w,
            h = params.h,
        })
        return setmetatable(brick, { __index = self })
    end
})

function new_brick_regular:draw()
    spr(u.sprites.bricks.tile_regular,
        self._offset_x + self.x,
        self._offset_y + self.y,
        self.w / u.tile_edge_length,
        self.h / u.tile_edge_length)
end

function new_brick_regular:hit_by_ball()
    self.visible = false
end
