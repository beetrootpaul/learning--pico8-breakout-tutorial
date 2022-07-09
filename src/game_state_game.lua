game_state_game = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state_game:init()
    bricks:init()
    paddle:init()
    ball:init()
    lives:init()
    score:init()
end

function game_state_game:update()
    paddle:update()
    ball:update()
end

function game_state_game:draw()
    cls()
    screen_game_area:draw()
    bricks:draw()
    paddle:draw()
    ball:draw()
    status_bar:draw()
end