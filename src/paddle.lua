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
local color = u.colors.light_grey

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function paddle:init()
    dx = 0
    self.x = u.screen_size_px / 2 - self.w / 2
    self.y = u.screen_size_px - bottom_gap - self.h
end

function paddle:update()
    dx = 0.5 * dx
    if btn(u.buttons.l) then
        dx = -2.5
    end
    if btn(u.buttons.r) then
        dx = 2.5
    end
    self.x = self.x + dx
    self.x = mid(0, self.x, u.screen_size_px - 1 - paddle.w)
end

function paddle:draw()
    rectfill(
        self.x, self.y,
        self.x + self.w, self.y + self.h,
        color
    )
end