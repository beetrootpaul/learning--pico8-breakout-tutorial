new_brick = setmetatable({}, {
    __call = function(self, params)
        local brick = {
            _offset_x = params.offset_x,
            _offset_y = params.offset_y,
            x = params.x,
            y = params.y,
            -- w and h are copied from bricks and shouldn't be modified, because in other places in
            -- the codebase we assume all bricks have same size. Then, why do we keep those copied
            -- values here? Because it simplifies collision handling where we pass a single brick
            -- with its x,y,w,h as a rectangle to check.
            w = params.w,
            h = params.h,
            _visible = true,
        }
        return setmetatable(brick, { __index = self })
    end
})

function new_brick:draw()
    spr(u.sprites.bricks.tile_regular,
        self._offset_x + self.x,
        self._offset_y + self.y,
        self.w / u.tile_edge_length,
        self.h / u.tile_edge_length)
end

function new_brick:is_visible()
    return self._visible
end

function new_brick:hit_by_ball()
    self._visible = false
end
