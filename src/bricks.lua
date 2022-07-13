new_bricks = setmetatable({}, {
    __call = function(self, params)
        local bricks = {
            _list = {},
            _game_area = params.game_area,
        }

        local brick_w = 10
        local brick_h = 6
        local brick_gap = 1
        local rows = 5
        local columns = 9
        local initial_x = bricks._game_area.w / 2 - (columns * (brick_w + brick_gap) - brick_gap) / 2
        local initial_y = 7
        for row = 0, rows - 1 do
            for column = 0, columns - 1 do
                add(bricks._list, new_brick({
                    x = initial_x + column * (brick_w + brick_gap),
                    y = initial_y + row * (brick_h + brick_gap),
                    w = brick_w,
                    h = brick_h
                }))
            end
        end

        return setmetatable(bricks, { __index = self })
    end
})

function new_bricks:draw()
    for _, brick in pairs(self._list) do
        if brick:is_visible() then
            rectfill(
                self._game_area.x + brick.x,
                self._game_area.y + brick.y,
                self._game_area.x + brick.x + brick.w - 1,
                self._game_area.y + brick.y + brick.h - 1,
                u.colors.pink)
        end
    end
end

function new_bricks:for_each_brick(callback)
    for _, brick in pairs(self._list) do
        callback(brick)
    end
end
