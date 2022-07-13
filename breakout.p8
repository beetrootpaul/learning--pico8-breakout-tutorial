pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
-- lazy dev's breakout tutorial
-- beetroot paul's take

#include src/utils.lua
#include src/debug.lua

#include src/game_states/gs_start_screen.lua
#include src/game_states/gs_in_game.lua
#include src/game_states/gs_game_over.lua

#include src/status_bar.lua
#include src/game_area.lua

#include src/lives.lua
#include src/score.lua

#include src/bricks.lua
#include src/brick.lua
#include src/paddle.lua
#include src/ball.lua

#include src/collisions.lua

#include src/main.lua

--[[

glyphs:
q > […]
w > [∧]
e > [░]
r > [➡️]
t > [⧗]
y > [▤]
u > [⬆️]
i > [☉]
o > [🅾️]
p > [◆]
a > [█]
s > [★]
d > [⬇️]
f > [✽]
g > [●]
h > [♥]
j > [웃]
k > [⌂]
l > [⬅️]
z > [▥]
x > [❎]
c > [🐱]
v > [ˇ]
b > [▒]
n > [♪]
m > [😐]

--]]

__gfx__
00000000fffffffe0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000feeeeee20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700feeeeee20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000e22222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666666666666666666666000000000099900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
667767777777777777767766000000009aa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
666666666666666666666666000000009aa990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600000000999a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d666d66666666666666d666d00000000099900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dddddddddddddddddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000024000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000202121220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001833018330183301832018320183101570015700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100002433024330243302432024320243100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00050000197501875015750137500f7500c7500b7500a750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010100001830018300183001830018300183000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
