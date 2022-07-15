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
            visible = true,
            destructible = true,
        }
        return setmetatable(brick, { __index = self })
    end
})

function new_brick:draw()
    -- Do nothing here, because the way this method works depend on a brick type.
    assert(false)
end

function new_brick:hit_by_ball()
    -- Do nothing here, because the way this method works depend on a brick type.
    assert(false)
end
