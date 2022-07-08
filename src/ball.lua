ball = {
    _x = 10,
    _y = 10,
    _dx = 2,
    _dy = 4,
    _r = 2,
    _color = u.colors.red,
}

local has_collided_in_prev_frame = false

function ball:update()
    local next_x = self._x + self._dx
    local next_y = self._y + self._dy

    if next_x < 0 or next_x > u.viewport_size_px - 1 then
        self._dx = -self._dx
        next_x = mid(0, next_x, u.viewport_size_px - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end
    if next_y < 0 or next_y > u.viewport_size_px - 1 then
        self._dy = -self._dy
        next_y = mid(0, next_y, u.viewport_size_px - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end

    local will_collide = collisions:is_ball_about_to_collide({
        ball_next_x = next_x, ball_next_y = next_y,
        ball_r = self._r,
        target_x = paddle.x, target_y = paddle.y,
        target_w = paddle.w, target_h = paddle.h,
    })
    local bounce_horizontally = collisions:should_bounce_ball_horizontally({
        ball_x = self._x, ball_y = self._y,
        ball_r = self._r,
        target_x = paddle.x, target_y = paddle.y,
        target_w = paddle.w, target_h = paddle.h,
    })
    if will_collide then
        if not has_collided_in_prev_frame then
            sfx(u.sfxs.ball_paddle_bounce)
        end
        if bounce_horizontally then
            if next_x < paddle.x + paddle.w / 2 then
                self._dx = -abs(self._dx)
                next_x = min(next_x, paddle.x - 1) + self._dx
            else
                self._dx = abs(self._dx)
                next_x = max(paddle.x + paddle.w + 1, next_x) + self._dx
            end
        else
            if next_y < paddle.y + paddle.h / 2 then
                self._dy = -abs(self._dy)
                next_y = min(next_y, paddle.y - 1) + self._dy
            else
                self._dy = abs(self._dy)
                next_y = max(paddle.y + paddle.h + 1, next_y) + self._dy
            end
        end
        has_collided_in_prev_frame = true
    else
        has_collided_in_prev_frame = false
    end

    self._x = next_x
    self._y = next_y
end

function ball:draw()
    circfill(self._x, self._y, self._r, self._color)
end
