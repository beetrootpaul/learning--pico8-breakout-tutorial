new_ball = setmetatable({}, {
    __call = function(self, params)
        local ball = {
            _x = 40,
            _y = 60,
            _r = u.sprites.ball.r,
            _dx = 1,
            _dy = 2,
            _has_collided_in_prev_frame = false,
            _game_area = params.game_area,
            _bricks = params.bricks,
            _paddle = params.paddle,
            _score = params.score,
        }
        return setmetatable(ball, { __index = self })
    end
})

function new_ball:update()
    -- Check this before updating x and y. Thanks to it we will end up with game over screen,
    --  which shows a ball that already crossed the game area's edge.
    self.is_outside_game_area = self._y + self._r > self._game_area.h - 1

    local next_x = self._x + self._dx
    local next_y = self._y + self._dy

    next_x, next_y = self:_handle_collision_with_game_area_edges(next_x, next_y)
    next_x, next_y = self:_handle_collision_with_paddle(next_x, next_y)
    self._bricks:for_each_brick(function(brick)
        if brick:is_visible() then
            next_x, next_y = self:_handle_collision_with_brick(next_x, next_y, brick)
        end
    end)

    self._x = next_x
    self._y = next_y
end

function new_ball:draw()
    spr(u.sprites.ball.tile,
        self._game_area.x + self._x - self._r,
        self._game_area.y + self._y - self._r,
        (1 + 2 * self._r) / u.tile_edge_length,
        (1 + 2 * self._r) / u.tile_edge_length)
end

function new_ball:_handle_collision_with_game_area_edges(next_x, next_y)
    if next_x - self._r < 0 or next_x + self._r > self._game_area.w - 1 then
        self._dx = -self._dx
        next_x = mid(0, next_x, self._game_area.w - 1)
        sfx(u.sfxs.ball_wall_bounce)
    elseif next_y - self._r < 0 then
        self._dy = -self._dy
        next_y = mid(0, next_y, self._game_area.h - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end
    return next_x, next_y
end

function new_ball:_handle_collision_with_paddle(next_x, next_y)
    local will_collide = collisions:is_ball_about_to_collide({
        ball_next_x = next_x, ball_next_y = next_y,
        ball_r = self._r,
        target_x = self._paddle.x, target_y = self._paddle.y,
        target_w = self._paddle.w, target_h = self._paddle.h,
    })
    local bounce_horizontally = collisions:should_bounce_ball_horizontally({
        ball_x = self._x, ball_y = self._y,
        ball_r = self._r,
        target_x = self._paddle.x, target_y = self._paddle.y,
        target_w = self._paddle.w, target_h = self._paddle.h,
    })
    if will_collide then
        if not self._has_collided_in_prev_frame then
            self._score:add_points(1)
            sfx(u.sfxs.ball_paddle_bounce)
        end
        if bounce_horizontally then
            if next_x < self._paddle.x + self._paddle.w / 2 then
                self._dx = -abs(self._dx)
                next_x = min(next_x, self._paddle.x - 1) + self._dx
            else
                self._dx = abs(self._dx)
                next_x = max(self._paddle.x + self._paddle.w + 1, next_x) + self._dx
            end
        else
            if next_y < self._paddle.y + self._paddle.h / 2 then
                self._dy = -abs(self._dy)
                next_y = min(next_y, self._paddle.y - 1) + self._dy
            else
                self._dy = abs(self._dy)
                next_y = max(self._paddle.y + self._paddle.h + 1, next_y) + self._dy
            end
        end
        self._has_collided_in_prev_frame = true
    else
        self._has_collided_in_prev_frame = false
    end
    return next_x, next_y
end

function new_ball:_handle_collision_with_brick(next_x, next_y, brick)
    local will_collide = collisions:is_ball_about_to_collide({
        ball_next_x = next_x, ball_next_y = next_y,
        ball_r = self._r,
        target_x = brick.x, target_y = brick.y,
        target_w = brick.w, target_h = brick.h,
    })
    local bounce_horizontally = collisions:should_bounce_ball_horizontally({
        ball_x = self._x, ball_y = self._y,
        ball_r = self._r,
        target_x = brick.x, target_y = brick.y,
        target_w = brick.w, target_h = brick.h,
    })
    if will_collide then
        self._score:add_points(10)
        sfx(u.sfxs.ball_brick_bounce)
        brick:hit_by_ball()
        if bounce_horizontally then
            if next_x < brick.x + brick.w / 2 then
                self._dx = -abs(self._dx)
            else
                self._dx = abs(self._dx)
            end
        else
            if next_y < brick.y + brick.h / 2 then
                self._dy = -abs(self._dy)
            else
                self._dy = abs(self._dy)
            end
        end
    end
    return next_x, next_y
end