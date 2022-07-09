game_state = {}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local current_state = game_state_start

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state:init()
    current_state:init()
end

function game_state:update()
    current_state:update()
end

function game_state:draw()
    current_state:draw()
end

function game_state:enter_state_game()
    current_state = game_state_game
    self:init()
end

function game_state:enter_state_over()
    current_state = game_state_over
    self:init()
end