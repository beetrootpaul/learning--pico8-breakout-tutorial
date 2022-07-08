game_state = {}

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

-- TODO refactor to have type inside and reassign lifecycle methods
local current_state = "game"

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function game_state:init()
    if current_state == "game" then
        game_state_game:init()
    else
        game_state_over:init()
    end
end

function game_state:update()
    if current_state == "game" then
        game_state_game:update()
    else
        game_state_over:update()
    end
end

function game_state:draw()
    if current_state == "game" then
        game_state_game:draw()
    else
        game_state_over:draw()
    end
end

function game_state:enter_state_game()
    current_state = "game"
    self:init()
end

function game_state:enter_state_over()
    current_state = "over"
    self:init()
end