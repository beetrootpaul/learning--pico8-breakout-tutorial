local debug = {}
d = debug

-- -- -- -- -- -- -- --
-- private variables --
-- -- -- -- -- -- -- --

local enabled = false
local messages = {}
local lines = {}
local circle_markers = {}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

-- Call it before other "update()" calls, because it clears the message,
-- which might be set in those other functions.
function debug:update()
    if btnp(u.buttons.o) then
        enabled = not enabled
    end
    messages = {}
    lines = {}
    circle_markers = {}
end

-- Call it after other "draw()" calls, because it prints the message
-- on top of everything else drawn by other functions.
function debug:draw()
    if not enabled then
        return
    end
    for ln in all(lines) do
        line(ln.x0, ln.y0, ln.x1, ln.y1, u.colors.orange)
    end
    for cmark in all(circle_markers) do
        circ(cmark.x, cmark.y, cmark.r, u.colors.orange)
    end
    for msg in all(messages) do
        print(msg, u.colors.orange)
    end
end

function debug:add_message(message)
    add(messages, message)
end

function debug:add_line(x0, y0, x1, y1)
    add(lines, { x0 = x0, y0 = y0, x1 = x1, y1 = y1 })
end

function debug:add_circle_marker(x, y, r)
    add(circle_markers, { x = x, y = y, r = r })
end