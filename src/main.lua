function _init()
    game_state:init()
end

function _update60()
    d:update()
    game_state:update()
end

function _draw()
    game_state:draw()
    d:draw()
end

-- TODO sticky paddle on every live
-- TODO start direction taken from paddle movement
-- TODO start direction indicator

