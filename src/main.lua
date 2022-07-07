function _init()
    cls()
end

function _update()
    ball.x = ball.x + ball.dx
    ball.y = ball.y + ball.dy
    if ball.x < 0 or ball.x > u.viewport_size_px - 1 then
        ball.dx = -ball.dx
        sfx(u.sfxs.ball_wall_bounce)
    end
    if ball.y < 0 or ball.y > u.viewport_size_px - 1 then
        ball.dy = -ball.dy
        sfx(u.sfxs.ball_wall_bounce)
    end
end

function _draw()
    cls(u.colors.dark_blue)
    circfill(ball.x, ball.y, ball.r, u.colors.yellow)
end
