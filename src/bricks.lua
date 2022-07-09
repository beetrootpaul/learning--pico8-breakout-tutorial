bricks = {
    -- -- -- -- -- -- -- --
    -- public properties --
    -- -- -- -- -- -- -- --
    list = {}
}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local w = 10
local h = 6
local gap = 1

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function bricks:init()
    self.list = {}
    local rows = 5
    local columns = 11
    local initial_x = u.screen_edge_length / 2 - (columns * (w + gap) - gap) / 2
    local initial_y = 4
    for row = 0, rows - 1 do
        for column = 0, columns - 1 do
            add(self.list, self:_new_brick(initial_x + column * (w + gap), initial_y + row * (h + gap)))
        end
    end
end

function bricks:draw()
    for brick in all(self.list) do
        if brick.visible then
            rectfill(
                brick.x,
                screen_game_area.offset_y + brick.y,
                brick.x + w - 1,
                screen_game_area.offset_y + brick.y + h - 1,
                u.colors.pink
            )
        end
    end
end

-- -- -- -- -- -- -- --
-- private methods   --
-- -- -- -- -- -- -- --

function bricks:_new_brick(x, y)
    return { x = x, y = y, w = w, h = h, visible = true }
end