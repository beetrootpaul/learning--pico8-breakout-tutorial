paddle = {
    _w = 24,
    _h = 3,
    _dx = 0,
}
paddle._x = u.viewport_size_px / 2 - paddle._w / 2
paddle._y = u.viewport_size_px - 5 - paddle._h

function paddle:update()
    self._dx = 0.5 * self._dx
    if btn(u.buttons.l) then
        self._dx = -5
    end
    if btn(u.buttons.r) then
        self._dx = 5
    end
    self._x = self._x + self._dx
end

function paddle:draw()
    rectfill(
        self._x, self._y,
        self._x + self._w, self._y + self._h,
        u.colors.white
    )
end