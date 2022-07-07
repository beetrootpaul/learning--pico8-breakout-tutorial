function _init()
    cls()
end

function _update()
    ball:update()
    paddle:update()
end

function _draw()
    cls(u.colors.dark_blue)
    ball:draw()
    paddle:draw()
end
