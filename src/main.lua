function _init()
    cls()
end

function _update()
    d:update()
    paddle:update()
    ball:update()
end

function _draw()
    cls(u.colors.dark_blue)
    paddle:draw()
    ball:draw()
    d:draw()
end
