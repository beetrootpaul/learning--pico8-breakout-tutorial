status_bar = {}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local margin = 2

-- -- -- -- -- -- -- --
-- public properties --
-- -- -- -- -- -- -- --

status_bar.h = margin + u.text_height_px + margin

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function status_bar:draw()
    rectfill(0, 0, u.screen_edge_length - 1, status_bar.h - 1, u.colors.violet_grey)

    local heart = "♥"
    local heart_w = u.measure_text_width(heart)
    for h = 1, lives.max do
        local color = u.colors.purple
        if h > lives.left then
            color = u.colors.dark_grey
        end
        print(heart, margin + (h - 1) * heart_w, margin, color)
    end

    local score_text = "score " .. score.points
    local score_text_w = u.measure_text_width(score_text)
    print(score_text, u.screen_edge_length - margin - score_text_w, margin, u.colors.light_grey)
end