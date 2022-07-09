screen_game_area = { }

-- -- -- -- -- -- -- --
-- public properties --
-- -- -- -- -- -- -- --

screen_game_area.offset_y = status_bar.h
screen_game_area.h = u.screen_edge_length - screen_game_area.offset_y

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function screen_game_area:draw()
    d:add_message(self.offset_y)
    d:add_message(self.w)
    d:add_message(self.h)
    rectfill(0, self.offset_y, u.screen_edge_length - 1, u.screen_edge_length - 1, u.colors.dark_blue)
end