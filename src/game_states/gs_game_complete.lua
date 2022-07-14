new_gs_game_complete = setmetatable({ }, {
    __call = function(self, params)
        local gs_game_complete = {
            _status_bar = params.status_bar,
        }
        return setmetatable(gs_game_complete, { __index = self })
    end
})

function new_gs_game_complete:update_and_get_next_state()
    if btnp(u.buttons.x) then
        return new_gs_start_screen()
    end
    return self
end

function new_gs_game_complete:draw()
    cls(u.colors.black)

    self._status_bar:draw()

    local text_gap = 6
    local stripe_h = text_gap + u.text_height_px + text_gap + u.text_height_px + text_gap
    rectfill(
        0, u.screen_edge_length / 2 - stripe_h / 2,
        u.screen_edge_length - 1, u.screen_edge_length / 2 + stripe_h / 2,
        u.colors.black)

    local text_1 = "★ all clear! ★"
    local text_2 = "press ❎ to start again"
    local text_1_w = u.measure_text_width(text_1)
    local text_2_w = u.measure_text_width(text_2)
    print(text_1,
        u.screen_edge_length / 2 - text_1_w / 2,
        u.screen_edge_length / 2 - text_gap / 2 - u.text_height_px,
        u.colors.yellow)
    print(text_2,
        u.screen_edge_length / 2 - text_2_w / 2,
        u.screen_edge_length / 2 + text_gap / 2,
        u.colors.light_grey)
end