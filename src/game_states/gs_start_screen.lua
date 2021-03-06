new_gs_start_screen = setmetatable({ }, {
    __call = function(self)
        return setmetatable({}, { __index = self })
    end
})

function new_gs_start_screen:update_and_get_next_state()
    if btnp(u.buttons.x) then
        return new_gs_in_game()
    end
    return self
end

function new_gs_start_screen:draw()
    cls(u.colors.dark_blue)

    local text_gap = 6
    local text_1 = "breakout"
    local text_2 = "press β to start"
    local text_3 = "in-game: β fires a ball"
    local text_4 = "in-game: πΎοΈ toggles debug layer"
    local text_1_w = u.measure_text_width(text_1)
    local text_2_w = u.measure_text_width(text_2)
    local text_3_w = u.measure_text_width(text_3)
    local text_4_w = u.measure_text_width(text_4)
    print(text_1,
        u.screen_edge_length / 2 - text_1_w / 2,
        u.screen_edge_length / 2 - 1.5 * text_gap - 2 * u.text_height_px,
        u.colors.yellow)
    print(text_2,
        u.screen_edge_length / 2 - text_2_w / 2,
        u.screen_edge_length / 2 - 0.5 * text_gap - u.text_height_px,
        u.colors.light_grey)
    print(text_3,
        u.screen_edge_length / 2 - text_3_w / 2,
        u.screen_edge_length / 2 + 0.5 * text_gap,
        u.colors.dark_grey)
    print(text_4,
        u.screen_edge_length / 2 - text_4_w / 2,
        u.screen_edge_length / 2 + 1.5 * text_gap + u.text_height_px,
        u.colors.dark_grey)
end