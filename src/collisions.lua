collisions = {}

function collisions:is_ball_about_to_collide(params)
    local ball = {
        next_x = params.ball_next_x,
        next_y = params.ball_next_y,
        r = params.ball_r,
    }
    local target = {
        x = params.target_x,
        y = params.target_y,
        w = params.target_w,
        h = params.target_h,
    }

    if ball.next_y + ball.r < target.y then
        return false
    end
    if ball.next_y - ball.r > target.y + target.h then
        return false
    end
    if ball.next_x + ball.r < target.x then
        return false
    end
    if ball.next_x - ball.r > target.x + target.w then
        return false
    end

    return true
end

function collisions:should_bounce_ball_horizontally(params)
    local ball = {
        x = params.ball_x,
        y = params.ball_y,
        r = params.ball_r,
    }
    local target = {
        x = params.target_x,
        y = params.target_y,
        w = params.target_w,
        h = params.target_h,
    }

    local debug_grid_x = 90
    local debug_grid_y = 10
    d:add_line(debug_grid_x, debug_grid_y + 10, debug_grid_x + 30, debug_grid_y + 10)
    d:add_line(debug_grid_x, debug_grid_y + 20, debug_grid_x + 30, debug_grid_y + 20)
    d:add_line(debug_grid_x + 10, debug_grid_y, debug_grid_x + 10, debug_grid_y + 30)
    d:add_line(debug_grid_x + 20, debug_grid_y, debug_grid_x + 20, debug_grid_y + 30)

    local is_ball_up_from_target = ball.y + ball.r < target.y
    local is_ball_down_from_target = ball.y - ball.r > target.y + target.h
    local is_ball_left_from_target = ball.x + ball.r < target.x
    local is_ball_right_from_target = ball.x - ball.r > target.x + target.w

    if is_ball_up_from_target and not is_ball_left_from_target and not is_ball_right_from_target then
        d:add_circle_marker(debug_grid_x + 15, debug_grid_y + 5, 3)
        return false
    end
    if is_ball_down_from_target and not is_ball_left_from_target and not is_ball_right_from_target then
        d:add_circle_marker(debug_grid_x + 15, debug_grid_y + 25, 3)
        return false
    end
    if is_ball_left_from_target and not is_ball_up_from_target and not is_ball_down_from_target then
        d:add_circle_marker(debug_grid_x + 5, debug_grid_y + 15, 3)
        return true
    end
    if is_ball_right_from_target and not is_ball_up_from_target and not is_ball_down_from_target then
        d:add_circle_marker(debug_grid_x + 25, debug_grid_y + 15, 3)
        return true
    end

    if is_ball_up_from_target and is_ball_right_from_target then
        d:add_circle_marker(debug_grid_x + 25, debug_grid_y + 5, 3)
    elseif is_ball_up_from_target and is_ball_left_from_target then
        d:add_circle_marker(debug_grid_x + 5, debug_grid_y + 5, 3)
    elseif is_ball_down_from_target and is_ball_right_from_target then
        d:add_circle_marker(debug_grid_x + 25, debug_grid_y + 25, 3)
    elseif is_ball_down_from_target and is_ball_left_from_target then
        d:add_circle_marker(debug_grid_x + 5, debug_grid_y + 25, 3)
    else
        d:add_circle_marker(debug_grid_x + 15, debug_grid_y + 15, 3)
    end

    local target_center_x = target.x + target.w / 2
    local target_center_y = target.y + target.h / 2
    local ball_to_target_center_slope = abs((ball.y - target_center_y) / (ball.x - target_center_x))
    local target_diagonals_slop = abs(target.w / target.h)
    local is_in_left_or_right_triangle = ball_to_target_center_slope < target_diagonals_slop
    if is_in_left_or_right_triangle then
        d:add_circle_marker(debug_grid_x + 14, debug_grid_y + 15, 0)
        d:add_circle_marker(debug_grid_x + 16, debug_grid_y + 15, 0)
    else
        d:add_circle_marker(debug_grid_x + 15, debug_grid_y + 14, 0)
        d:add_circle_marker(debug_grid_x + 15, debug_grid_y + 16, 0)
    end
    return is_in_left_or_right_triangle
end