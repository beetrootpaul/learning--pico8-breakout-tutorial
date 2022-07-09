game_state_start = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state_start:init()
end

function game_state_start:update()
    if btnp(u.buttons.x) then
        game_state:enter_state_game()
    end
end

function game_state_start:draw()
    cls(u.colors.dark_blue)

    local text_gap = 6
    local text_1 = "breakout"
    local text_2 = "press ❎ to start"
    local text_1_w = u.measure_text_width(text_1)
    local text_2_w = u.measure_text_width(text_2)
    print(text_1, u.screen_edge_length / 2 - text_1_w / 2, u.screen_edge_length / 2 - text_gap / 2 - u.text_height_px, u.colors.yellow)
    print(text_2, u.screen_edge_length / 2 - text_2_w / 2, u.screen_edge_length / 2 + text_gap / 2, u.colors.light_grey)
end