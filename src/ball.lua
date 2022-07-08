ball = {}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local x
local y
local dx
local dy
local r = 2
local color = u.colors.red
local has_collided_in_prev_frame = false

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function ball:init()
    x = 10
    y = 10
    dx = 1
    dy = 2
end

function ball:update()
    local next_x = x + dx
    local next_y = y + dy

    if next_y + r > u.screen_size_px - 1 then
        if lives:is_any_left() then
            lives:lose_one()
            -- TODO here we refer to ball and paddle explicitly, and …
            ball:init()
            paddle:init()
            sfx(u.sfxs.live_lost)
        else
            -- TODO … and here we have them hidden inside game state
            game_state:enter_state_over()
        end
        return
    end

    if next_x - r < 0 or next_x + r > u.screen_size_px - 1 then
        dx = -dx
        next_x = mid(0, next_x, u.screen_size_px - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end
    if next_y - r < 0 then
        dy = -dy
        next_y = mid(0, next_y, u.screen_size_px - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end

    local will_collide = collisions:is_ball_about_to_collide({
        ball_next_x = next_x, ball_next_y = next_y,
        ball_r = r,
        target_x = paddle.x, target_y = paddle.y,
        target_w = paddle.w, target_h = paddle.h,
    })
    local bounce_horizontally = collisions:should_bounce_ball_horizontally({
        ball_x = x, ball_y = y,
        ball_r = r,
        target_x = paddle.x, target_y = paddle.y,
        target_w = paddle.w, target_h = paddle.h,
    })
    if will_collide then
        if not has_collided_in_prev_frame then
            sfx(u.sfxs.ball_paddle_bounce)
        end
        if bounce_horizontally then
            if next_x < paddle.x + paddle.w / 2 then
                dx = -abs(dx)
                next_x = min(next_x, paddle.x - 1) + dx
            else
                dx = abs(dx)
                next_x = max(paddle.x + paddle.w + 1, next_x) + dx
            end
        else
            if next_y < paddle.y + paddle.h / 2 then
                dy = -abs(dy)
                next_y = min(next_y, paddle.y - 1) + dy
            else
                dy = abs(dy)
                next_y = max(paddle.y + paddle.h + 1, next_y) + dy
            end
        end
        has_collided_in_prev_frame = true
    else
        has_collided_in_prev_frame = false
    end

    x = next_x
    y = next_y
end

function ball:draw()
    circfill(x, y, r, color)
end
