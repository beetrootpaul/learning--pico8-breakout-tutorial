new_status_bar = setmetatable({}, {
    __call = function(self, params)
        local status_bar = {
            _margin = 2,
            _lives = params.lives,
            _score = params.score,
        }
        status_bar.h = status_bar._margin + u.text_height_px + status_bar._margin
        return setmetatable(status_bar, { __index = self })
    end
})

function new_status_bar:draw()
    rectfill(
        0, 0,
        u.screen_edge_length - 1, self.h - 1,
        u.colors.violet_grey)

    local heart = "♥"
    local heart_w = u.measure_text_width(heart)
    for h = 1, self._lives.max do
        local color = u.colors.purple
        if h > self._lives.left then
            color = u.colors.dark_grey
        end
        print(heart,
            self._margin + (h - 1) * heart_w, self._margin,
            color)
    end

    local score_text = "score " .. self._score.points
    local score_text_w = u.measure_text_width(score_text)
    print(score_text,
        u.screen_edge_length - self._margin - score_text_w, self._margin,
        u.colors.light_grey)
end