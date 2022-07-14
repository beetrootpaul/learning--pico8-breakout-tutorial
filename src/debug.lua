local debug = {
    _enabled = false,
    _persistent_messages = {},
    _messages = {},
    _lines = {},
    _circle_markers = {},
}
d = debug

local messages_offset_x = 1
local messages_offset_y = 8

-- Call it before other "update()" calls, because it clears the message,
-- which might be set in those other functions.
function debug:update()
    if btnp(u.buttons.o) then
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
    for _, ln in pairs(self._lines) do
        line(ln.x0, ln.y0, ln.x1, ln.y1, u.colors.white)
    end
    for _, cmark in pairs(self._circle_markers) do
        circ(cmark.x, cmark.y, cmark.r, u.colors.white)
    end
    for i, msg in pairs(self._persistent_messages) do
        print(msg, messages_offset_x, messages_offset_y + i * (u.text_height_px + 1), u.colors.white)
        printh(msg)
    end
    for i, msg in pairs(self._messages) do
        print(msg, messages_offset_x, messages_offset_y + (#self._persistent_messages + i) * (u.text_height_px + 1), u.colors.white)
        printh(msg)
    end
end

function debug:add_persistent_message(message)
    add(self._persistent_messages, message)
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
