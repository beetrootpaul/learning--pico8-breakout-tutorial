new_paddle = setmetatable({}, {
    __call = function(self, params)
        local paddle = {
            w = 24,
            h = 4,
            _max_dx = 3,
            _dx = 0,
            _game_area = params.game_area,
        }
        local bottom_gap = 12
        paddle.x = paddle._game_area.w / 2 - paddle.w / 2
        paddle.y = paddle._game_area.h - bottom_gap - paddle.h
        return setmetatable(paddle, { __index = self })
    end
})

function new_paddle:move_left()
    self._dx = -self._max_dx
end

function new_paddle:move_right()
    self._dx = self._max_dx
end

function new_paddle:update()
    self._dx = 0.5 * self._dx
    d:add_message("p.dx=" .. self._dx)
    self.x = self.x + self._dx
    self.x = mid(0, self.x, self._game_area.w - 1 - self.w)
end

function new_paddle:draw()
    rectfill(
        self._game_area.x + self.x, self._game_area.y + self.y,
        self._game_area.x + self.x + self.w, self._game_area.y + self.y + self.h,
        u.colors.light_grey
    )
end
