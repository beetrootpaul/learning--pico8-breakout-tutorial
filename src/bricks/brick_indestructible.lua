new_brick_indestructible = setmetatable({}, {
    __call = function(self, params)
        local brick = new_brick({
            offset_x = params.offset_x,
            offset_y = params.offset_y,
            x = params.x,
            y = params.y,
            w = params.w,
            h = params.h,
        })
        brick.destructible = false
        return setmetatable(brick, { __index = self })
    end
})

function new_brick_indestructible:draw()
    palt(u.colors.black, false)
    palt(u.colors.salmon, true)
    spr(u.sprites.bricks.tile_indestructible,
        self._offset_x + self.x,
        self._offset_y + self.y,
        self.w / u.tile_edge_length,
        self.h / u.tile_edge_length)
    palt()
end

function new_brick_indestructible:hit_by_ball()
    sfx(u.sfxs.ball_hit_brick_indestructible)
end
