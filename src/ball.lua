ball = {}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local x
local y
local dx
local dy
local r = 2
local color = u.colors.orange
local has_collided_in_prev_frame = false

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function ball:init()
    x = 40
    y = 60
    dx = 1
    dy = 2
end

function ball:update()
    local next_x = x + dx
    local next_y = y + dy

    next_x, next_y = self:_handle_collision_with_game_area_edges(next_x, next_y)
    next_x, next_y = self:_handle_collision_with_paddle(next_x, next_y)
    for brick in all(bricks.list) do
        if brick.visible then
            next_x, next_y = self:_handle_collision_with_brick(next_x, next_y, brick)
        end
    end

    x = next_x
    y = next_y
end

function ball:draw()
    circfill(x, screen_game_area.offset_y + y, r, color)
end

-- -- -- -- -- -- -- --
-- private methods   --
-- -- -- -- -- -- -- --

function ball:_handle_collision_with_game_area_edges(next_x, next_y)
    if next_y + r > screen_game_area.h - 1 then
        lives:lose_one()
        sfx(u.sfxs.live_lost)
        -- TODO Should state management happen here, inside ball's code?
        if lives:is_any_left() then
            -- TODO here we refer to ball and paddle explicitly, and …
            ball:init()
            paddle:init()
        else
            -- TODO … and here we have them hidden inside game state
            game_state:enter_state_over()
        end
    elseif next_x - r < 0 or next_x + r > u.screen_edge_length - 1 then
        dx = -dx
        next_x = mid(0, next_x, u.screen_edge_length - 1)
        sfx(u.sfxs.ball_wall_bounce)
    elseif next_y - r < 0 then
        dy = -dy
        next_y = mid(0, next_y, screen_game_area.h - 1)
        sfx(u.sfxs.ball_wall_bounce)
    end
    return next_x, next_y
end

function ball:_handle_collision_with_paddle(next_x, next_y)
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
            score:add_points(1)
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
    return next_x, next_y
end

function ball:_handle_collision_with_brick(next_x, next_y, brick)
    local will_collide = collisions:is_ball_about_to_collide({
        ball_next_x = next_x, ball_next_y = next_y,
        ball_r = r,
        target_x = brick.x, target_y = brick.y,
        target_w = brick.w, target_h = brick.h,
    })
    local bounce_horizontally = collisions:should_bounce_ball_horizontally({
        ball_x = x, ball_y = y,
        ball_r = r,
        target_x = brick.x, target_y = brick.y,
        target_w = brick.w, target_h = brick.h,
    })
    if will_collide then
        score:add_points(10)
        sfx(u.sfxs.ball_brick_bounce)
        brick.visible = false
        if bounce_horizontally then
            if next_x < brick.x + brick.w / 2 then
                dx = -abs(dx)
            else
                dx = abs(dx)
            end
        else
            if next_y < brick.y + brick.h / 2 then
                dy = -abs(dy)
            else
                dy = abs(dy)
            end
        end
    end
    return next_x, next_y
end