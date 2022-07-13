new_gs_in_game = setmetatable({ }, {
    __call = function(self)
        local current_level = 1

        local lives = new_lives()
        local score = new_score()
        local status_bar = new_status_bar({ lives = lives, score = score })
        local game_area = new_game_area({ status_bar = status_bar })
        local bricks = new_bricks({
            serialized_level = u.serialized_levels[current_level],
            game_area = game_area,
        })
        local paddle = new_paddle({ game_area = game_area })
        local ball = new_ball({
            game_area = game_area,
            bricks = bricks,
            paddle = paddle,
            score = score,
        })

        local gs_in_game = {
            _current_level = current_level,
            _status_bar = status_bar,
            _game_area = game_area,
            _bricks = bricks,
            _paddle = paddle,
            _ball = ball,
            _lives = lives,
            _score = score,
        }

        return setmetatable(gs_in_game, { __index = self })
    end
})

function new_gs_in_game:update_and_get_next_state()
    -- Check this before updating other things. Thanks to it we will end up with level completion
    --  1 frame after ball hit the last brick instead of on that very moment.
    if not self._bricks:is_any_left() then
        if self._current_level > #u.serialized_levels then
            return new_gs_game_complete({
                status_bar = self._status_bar,
            })
        else
            self._current_level = self._current_level + 1
            self._lives = new_lives()
            self._status_bar = new_status_bar({ lives = self._lives, score = self._score })
            self._bricks = new_bricks({
                serialized_level = u.serialized_levels[self._current_level],
                game_area = self._game_area,
            })
            self._paddle = new_paddle({ game_area = self._game_area })
            self._ball = new_ball({
                game_area = self._game_area,
                bricks = self._bricks,
                paddle = self._paddle,
                score = self._score,
            })
            return self
        end
    end

    if btn(u.buttons.l) then
        self._paddle:move_left()
    end
    if btn(u.buttons.r) then
        self._paddle:move_right()
    end
    self._paddle:update()
    self._ball:update()

    if self._ball.is_outside_game_area then
        self._lives:lose_one()
        if self._lives:is_any_left() then
            self._paddle = new_paddle({ game_area = self._game_area })
            self._ball = new_ball({
                game_area = self._game_area,
                bricks = self._bricks,
                paddle = self._paddle,
                score = self._score,
            })
            return self
        else
            return new_gs_game_over({
                status_bar = self._status_bar,
                game_area = self._game_area,
                paddle = self._paddle,
                ball = self._ball,
            })
        end
    end

    return self
end

function new_gs_in_game:draw()
    cls(u.colors.black)

    self._game_area:draw()
    clip(
        self._game_area.x, self._game_area.y,
        self._game_area.w, self._game_area.h)
    self._bricks:draw()
    self._paddle:draw()
    self._ball:draw()
    clip()

    self._status_bar:draw()
end
