new_bricks = setmetatable({}, {
    __call = function(self, params)
        local bricks = {
            _list = {},
            _game_area = params.game_area,
        }

        local brick_w = u.sprites.bricks.w
        local brick_h = u.sprites.bricks.h
        local brick_gap = 1
        local rows = 7
        local columns = 13
        local initial_x = bricks._game_area.w / 2 - (columns * (brick_w + brick_gap) - brick_gap) / 2
        local initial_y = 7
        for row = 0, rows - 1 do
            for column = 0, columns - 1 do
                if (columns*row + column) % 2 ~= 1 then
                    add(bricks._list, new_brick_regular({
                        offset_x = bricks._game_area.x,
                        offset_y = bricks._game_area.y,
                        x = initial_x + column * (brick_w + brick_gap),
                        y = initial_y + row * (brick_h + brick_gap),
                        w = brick_w,
                        h = brick_h
                    }))
                else
                    add(bricks._list, new_brick_hardened({
                        offset_x = bricks._game_area.x,
                        offset_y = bricks._game_area.y,
                        x = initial_x + column * (brick_w + brick_gap),
                        y = initial_y + row * (brick_h + brick_gap),
                        w = brick_w,
                        h = brick_h
                    }))
                end
            end
        end

        return setmetatable(bricks, { __index = self })
    end
})

function new_bricks:draw()
    self:for_each_visible_brick(function(brick)
        brick:draw()
    end)
end

function new_bricks:for_each_visible_brick(callback)
    for _, brick in pairs(self._list) do
        if brick.visible then
            callback(brick)
        end
    end
end
