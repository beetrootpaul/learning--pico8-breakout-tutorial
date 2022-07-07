ball = {
    _x = 1,
    _y = 64,
    _dx = 2,
    _dy = 3,
    _r = 2,
}

function ball:update()
    self._x = self._x + self._dx
    self._y = self._y + self._dy
    if self._x < 0 or self._x > u.viewport_size_px - 1 then
        self._dx = -self._dx
        sfx(u.sfxs.ball_wall_bounce)
    end
    if self._y < 0 or self._y > u.viewport_size_px - 1 then
        self._dy = -self._dy
        sfx(u.sfxs.ball_wall_bounce)
    end
end

function ball:draw()
    circfill(self._x, self._y, self._r, u.colors.yellow)
end
