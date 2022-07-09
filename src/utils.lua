local text_height_px = 5

local utils = {
    buttons = {
        l = 0,
        r = 1,
        u = 2,
        d = 3,
        o = 4,
        x = 5,
    },
    colors = {
        black = 0,
        dark_blue = 1,
        purple = 2,
        dark_green = 3,
        brown = 4,
        dark_grey = 5,
        light_grey = 6,
        white = 7,
        red = 8,
        orange = 9,
        yellow = 10,
        lime = 11,
        blue = 12,
        violet_grey = 13,
        pink = 14,
        salmon = 15,
    },
    measure_text_width = function(text)
        local y_to_print_outside_screen = -text_height_px
        return print(text, 0, y_to_print_outside_screen)
    end,
    screen_edge_length = 128,
    sfxs = {
        ball_wall_bounce = 0,
        ball_paddle_bounce = 0,
        ball_brick_bounce = 1,
        live_lost = 2,
    },
    text_height_px = text_height_px,
}

u = utils