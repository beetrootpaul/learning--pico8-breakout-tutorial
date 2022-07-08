-- Some parts of PICO-8 API written down and annotated by Beetroot Paul (https://beetrootpaul.com)

-- Most of descriptions are copied from the official PICO-8 docs (https://www.lexaloffle.com/dl/docs/pico-8_manual.html)
--
-- This file is not intended to be included in PICO-8 game, because it would overwrite
-- PICO-8's global functions. Instead, its only purpose is to help IDE with code completion,
-- function param hints, etc. (as long as your IDE treat this file as part of the project).
--


--- Returns the absolute (positive) value of x
---
--- @param x number
--- @return number
function abs(x)
end

--- Add value VAL to the end of table TBL. Equivalent to: TBL[#TBL + 1] = VAL
---
--- If index is given then the element is inserted at that position.
---
--- @param tbl table
--- @param val any
--- @param index number, optional
function add(tbl, val, index)
end

--- Used in FOR loops to iterate over all items in a table (that have a 1-based integer index), in the order they were added.
--- @param tbl table
function all(tbl)
end

--- Get button B state for player PL (default 0)
---
--- If no parameters supplied, returns a bitfield of all 12 button states for player 0 & 1 (P0: bits 0..5 P1: bits 8..13)
---
--- @param b number|string a glyph or from 0 to 5: left, right, up, down, button_o, button_x
--- @param pl number player, from 0 to 7, optional, default: 0
--- @return boolean|number whether button is pressed or not, or a bitfield
function btn(b, pl)
end

--- BTNP is short for "Button Pressed"; Instead of being true when a button is held down,
--- BTNP returns true when a button is down AND it was not down the last frame. It also
--- repeats after 15 frames, returning true every 4 frames after that (at 30fps -- double
--- that at 60fps). This can be used for things like menu navigation or grid-wise player
--- movement.
--- @param b number|string a glyph or from 0 to 5: left, right, up, down, button_o, button_x
--- @param pl number player, from 0 to 7, optional, default: 0
--- @return boolean whether button is pressed or not
function btnp(b, pl)
end

--- Set a screen offset of -x, -y for all drawing operations
---
--- CAMERA() to reset
---
--- @param x number, optional in pair with y
--- @param y number, optional in pair with x
function camera(x, y)
end

--- Draw a circle at x,y with radius r.
---
--- If r is negative, the circle is not drawn.
---
--- @param x number
--- @param y number
--- @param r number
--- @param col number color, optional
function circ(x, y, r, col)
end

--- Draw a filled circle at x,y with radius r.
---
--- If r is negative, the circle is not drawn.
---
--- @param x number
--- @param y number
--- @param r number
--- @param col number color, optional
function circfill(x, y, r, col)
end

--- Clear the screen and reset the clipping rectangle.
--- @param col number optional, default: black
function cls(col)
end

--- Special system command, where CMD_STR is a string:
---
--- - "pause" - request the pause menu be opened\n
---
--- - "reset" - request a cart reset\n
---
--- - "go_back" - return to the previous cart if there is one
---
--- - "label" - set cart label
---
--- - "screen" - save a screenshot
---
--- - "rec" - set video start point
---
--- - "rec_frames" - set video start point in frames mode
---
--- - "video" - save a .gif to desktop
---
--- - "audio_rec" - start recording audio
---
--- - "audio_end" - save recorded audio to desktop (no supported from web)
---
--- - "shutdown" - quit cartridge (from exported binary)
---
--- - "folder" - open current working folder on the host operating system
---
--- - "set_filename" - set the filename for screenshots / gifs / audio recordings
---
--- - "set_title"     set the host window title
---
--- Some commands have optional number parameters:
---
--- - "video" and "screen": P1: an integer scaling factor that overrides the system setting. P2: when > 0, save to the current folder instead of to desktop
---
--- - "audio_end" P1: when > 0, save to the current folder instead of to desktop
---
--- @param cmdstr string
--- @param p1 number
--- @param p2 number
function extcmd(cmdstr, p1, p2)
end

--- Get the value of sprite N's flag F.
--- When F is omitted, all flags are retrieved/set as a single bitfield.
--- @param n number sprite
--- @param f number flag index, from 0 to 7, optional
--- @return boolean whether flag is set or not
function fget(n, f)
end

--- Returns the floor value of a parameter
--- @param x number
--- @return number
function flr(x)
end

--- Draw a line from (X0, Y0) to (X1, Y1).
---
--- If (X1, Y1) are not given, the end of the last drawn line is used.
---
--- @param x0 number
--- @param y0 number
--- @param x1 number optional in pair with y1
--- @param y1 number optional in pair with x1
--- @param col number color, optional
function line(x0, y0, x1, y1, col)
end

--- Draw section of map (starting from CELL_X, CELL_Y) at screen position SX, SY (pixels).
--- @param cell_x number optional
--- @param cell_y number
--- @param sx number optional in pair with sy
--- @param sy number optional in pair with sx
--- @param cell_w number optional in pair with cell_h, default: 128
--- @param cell_h number optional in pair with cell_w, default: 32, which is top half of the map
--- @param layers number a bitfield of sprites' flags to match, optional
function map(cell_x, cell_y, sx, sy, cell_w, cell_h, layers)
end

--- Returns the maximum value of parameters
--- @param x number
--- @param y number
--- @return number
function max(x, y)
end

--- Returns the middle value of parameters
--- @param x number
--- @param y number
--- @param z number
--- @return number
function mid(x, y, z)
end

--- Returns the minimum value of parameters
--- @param x number
--- @param y number
function min(x, y)
end

--- Get map value at X,Y
--- @param x number map cell X
--- @param y number map cell Y
--- @return number map value (sprite), 0 if outside of the map range
function mget(x, y)
end

--- Set map value (VAL) at X,Y
--- @param x number map cell X
--- @param y number map cell Y
--- @param val number map value (sprite)
function mset(x, y, val)
end

--- Used in FOR loops to iterate over table TBL, providing both the key and value for each item.
---
--- Unlike ALL(), PAIRS() iterates over every item regardless of indexing scheme. Order is not guaranteed.
---
--- @param tbl table
function pairs(tbl)
end

--- Print a string STR and optionally set the draw colour to COL.
--- @param str string text to print
--- @param x number
--- @param y number
--- @param col number color
--- @return number the right-most x position that occurred while printing
function print(str, x, y, col)
end

--- Draw a rectangle with corners at (X0, Y0), (X1, Y1).
--- @param x0 number top-left corner
--- @param y0 number top-left corner
--- @param x1 number bottom-right corner
--- @param y1 number bottom-right corner
--- @param col number color, optional
function rect(x0, y0, x1, y1, col)
end

--- Draw a filled rectangle with corners at (X0, Y0), (X1, Y1).
--- @param x0 number top-left corner
--- @param y0 number top-left corner
--- @param x1 number bottom-right corner
--- @param y1 number bottom-right corner
--- @param col number color, optional
function rectfill(x0, y0, x1, y1, col)
end

--- Play sfx N (0..63) on CHANNEL (0..3) from note OFFSET (0..31 in notes) for LENGTH notes.
---
--- Using negative CHANNEL values have special meanings:
---
--- - CHANNEL -1: (default) to automatically choose a channel that is not being used
---
--- - CHANNEL -2: to stop the given sound from playing on any channel
---
--- N can be a command for the given CHANNEL (or all channels when CHANNEL < 0):
---
--- - N -1: to stop sound on that channel
---
--- - N -2: to release sound on that channel from looping
---
--- @param n number index of SFX to play
--- @param channel number optional, default: -1
--- @param offset number
--- @param length number
function sfx(n, channel, offset, length)
end

--- Draw sprite N (0..255) at position X,Y
--- @param n number
--- @param x number
--- @param y number
--- @param w number how many sprites to blit, optional in pair with h, default: 1
--- @param h number how many sprites to blit, optional in pair with w, default: 1
--- @param flip_x boolean
--- @param flip_y boolean
function spr(n, x, y, w, h, flip_x, flip_y)
end

--- Convert VAL to a string.
---
--- FORMAT_FLAGS is a bitfield:
---
---  - 0x1: Write the raw hexadecimal value of numbers, functions or tables.
---
---  - 0x2: Write VAL as a signed 32-bit integer by shifting it left by 16 bits.
---
--- TOSTR(NIL) returns "[nil]"
---
--- TOSTR() returns ""
---
--- @param val any
--- @param format_flags number bitfield, optional
--- @return string
function tostr(val, format_flags)
end