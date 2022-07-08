paddle = {
    w = 24,
    h = 4,
    _bottom_gap = 12,
    _dx = 0,
    _color = u.colors.light_grey,
}
paddle.x = u.viewport_size_px / 2 - paddle.w / 2
paddle.y = u.viewport_size_px - paddle._bottom_gap - paddle.h

-- TODO stop paddle on screen edges
function paddle:update()
    self._dx = 0.5 * self._dx
    if btn(u.buttons.l) then
        self._dx = -5
    end
    if btn(u.buttons.r) then
        self._dx = 5
    end
    self.x = self.x + self._dx
end

function paddle:draw()
    rectfill(
        self.x, self.y,
        self.x + self.w, self.y + self.h,
        self._color
    )
end