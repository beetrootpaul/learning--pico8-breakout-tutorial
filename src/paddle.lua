paddle = {
    -- -- -- -- -- -- -- --
    -- public properties --
    -- -- -- -- -- -- -- --
    w = 24,
    h = 4,
    x = nil,
    y = nil,
}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local bottom_gap = 12
local dx = 0
local max_dx = 3
local color = u.colors.light_grey

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function paddle:init()
    dx = 0
    self.x = u.screen_edge_length / 2 - self.w / 2
    self.y = screen_game_area.h - bottom_gap - self.h
end

function paddle:update()
    dx = 0.5 * dx
    if btn(u.buttons.l) then
        dx = -max_dx
    end
    if btn(u.buttons.r) then
        dx = max_dx
    end
    d:add_message("p.dx=" .. dx)
    self.x = self.x + dx
    self.x = mid(0, self.x, u.screen_edge_length - 1 - paddle.w)
end

function paddle:draw()
    rectfill(
        self.x, screen_game_area.offset_y + self.y,
        self.x + self.w, screen_game_area.offset_y + self.y + self.h,
        color
    )
end