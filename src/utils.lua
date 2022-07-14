local text_height_px = 5
local tile_edge_length = 8

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
    serialized_levels = {
        [[


            -          #
        ]],
        [[


            -------


            -------
        ]],
        --[[
            #-----------#
            ---#------#--
            ------#------
            ---#------#--
            #-----------#
        ]]--,
        --[[
            ###
            #-#
            ###
        ]]--,
    },
    sfxs = {
        ball_wall_bounce = 0,
        ball_paddle_bounce = 0,
        ball_brick_bounce = 1,
        live_lost = 2,
    },
    sprites = {
        ball = {
            r = 2,
            tile = 36,
        },
        bricks = {
            w = 8,
            h = 4,
            tile_regular = 1,
            tile_hardened_initial = 2,
            tile_hardened_weakened = 3,
        },
        paddle = {
            w = 32,
            h = 6,
            tile_left = 32,
            tile_middle = 33,
            tile_right = 34,
        }
    },
    text_height_px = text_height_px,
    tile_edge_length = tile_edge_length,
    trim = function(text)
        local result = text
        while sub(result, 1, 1) == ' ' do
            result = sub(result, 2)
        end
        while sub(result, #result, #result) == ' ' do
            result = sub(result, 0, #result - 1)
        end
        return result
    end
}

u = utils