game_state_over = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state_over:init()
end

function game_state_over:update()
    if btnp(u.buttons.x) then
        game_state:enter_state_game()
    end
end

function game_state_over:draw()
    cls(u.colors.dark_blue)
    paddle:draw()
    ball:draw()
    status_bar:draw()

    local text_gap = 6
    local stripe_h = text_gap + u.text_height_px + text_gap + u.text_height_px + text_gap
    rectfill(0, u.screen_size_px / 2 - stripe_h / 2, u.screen_size_px - 1, u.screen_size_px / 2 + stripe_h / 2, u.colors.black)
    local text_1 = "game over"
    local text_2 = "press ❎ to start again"
    local text_1_w = u.measure_text_width(text_1)
    local text_2_w = u.measure_text_width(text_2)
    print(text_1, u.screen_size_px / 2 - text_1_w / 2, u.screen_size_px / 2 - stripe_h / 2 + text_gap, u.colors.orange)
    print(text_2, u.screen_size_px / 2 - text_2_w / 2, u.screen_size_px / 2 + stripe_h / 2 - text_gap - u.text_height_px, u.colors.light_grey)
end