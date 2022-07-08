status_bar = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function status_bar:draw()
    local margin = 2
    rectfill(0, 0, u.screen_size_px - 1, u.text_height_px + 2 * margin - 1, u.colors.violet_grey)

    local heart = "♥"
    local heart_w = u.measure_text_width(heart)
    for h=1,lives.max do
        local color = u.colors.purple
        if h > lives.left then
            color = u.colors.dark_grey
        end
        print(heart, margin + (h-1) * heart_w, margin, color)
    end
end