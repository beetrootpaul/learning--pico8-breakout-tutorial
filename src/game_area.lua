new_game_area = setmetatable({}, {
    __call = function(self, params)
        local game_area = {
            x = 0,
        }
        game_area.y = params.status_bar.h
        game_area.w = u.screen_edge_length - game_area.x
        game_area.h = u.screen_edge_length - game_area.y
        return setmetatable(game_area, { __index = self })
    end
})

function new_game_area:draw()
    rectfill(
        self.x, self.y,
        self.x + self.w - 1, self.y + self.h - 1,
        u.colors.dark_blue)
end