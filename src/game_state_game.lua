game_state_game = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state_game:init()
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
    cls(u.colors.dark_blue)
    paddle:draw()
    ball:draw()
    status_bar:draw()
end