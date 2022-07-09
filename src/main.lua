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

-- TODO screen.game_area.x/y/w/h to offset after status bar is added