local debug = {
    _enabled = false,
    _messages = {},
    _lines = {},
    _circle_markers = {},
}

-- Call it before other "update()" calls, because it clears the message,
-- which might be set in those other functions.
function debug:update()
    if btnp(u.buttons.x) then
        self._enabled = not self._enabled
    end
    self._messages = {}
    self._lines = {}
    self._circle_markers = {}
end

-- Call it after other "draw()" calls, because it prints the message
-- on top of everything else drawn by other functions.
function debug:draw()
    if not self._enabled then
        return
    end
    for ln in all(self._lines) do
        line(ln.x0, ln.y0, ln.x1, ln.y1, u.colors.orange)
    end
    for cmark in all(self._circle_markers) do
        circ(cmark.x, cmark.y, cmark.r, u.colors.orange)
    end
    for msg in all(self._messages) do
        print(msg, u.colors.orange)
    end
end

function debug:add_message(message)
    add(self._messages, message)
end

function debug:add_line(x0, y0, x1, y1)
    add(self._lines, { x0 = x0, y0 = y0, x1 = x1, y1 = y1 })
end

function debug:add_circle_marker(x, y, r)
    add(self._circle_markers, { x = x, y = y, r = r })
end

d = debug