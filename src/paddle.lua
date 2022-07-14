new_paddle = setmetatable({}, {
    __call = function(self, params)
        local paddle = {
            w = u.sprites.paddle.w,
            h = u.sprites.paddle.h,
            _max_dx = 2,
            _dx = 0,
            _game_area = params.game_area,
        }
        local bottom_gap = 4
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

function new_paddle:moves_fast_left()
    return self._dx < -self._max_dx * 0.4
end

function new_paddle:moves_fast_right()
    return self._dx > self._max_dx * 0.4
end

function new_paddle:update()
    --d:add_message("p.dx=" .. self._dx)
    self.x = self.x + self._dx
    self.x = mid(0, self.x, self._game_area.w - 1 - self.w)
    self._dx = 0.6 * self._dx
end

function new_paddle:draw()
    spr(u.sprites.paddle.tile_left,
        self._game_area.x + self.x,
        self._game_area.y + self.y,
        1,
        self.h / u.tile_edge_length)
    spr(u.sprites.paddle.tile_middle,
        self._game_area.x + self.x + u.tile_edge_length,
        self._game_area.y + self.y,
        1,
        self.h / u.tile_edge_length)
    spr(u.sprites.paddle.tile_middle,
        self._game_area.x + self.x + 2 * u.tile_edge_length,
        self._game_area.y + self.y,
        1,
        self.h / u.tile_edge_length)
    spr(u.sprites.paddle.tile_right,
        self._game_area.x + self.x + 3 * u.tile_edge_length,
        self._game_area.y + self.y,
        1,
        self.h / u.tile_edge_length)
end
