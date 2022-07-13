local current_game_state

function _init()
    current_game_state = new_gs_start_screen()
end

function _update60()
    d:update()

    local next_state = current_game_state:update_and_get_next_state()
    current_game_state = next_state
end

function _draw()
    current_game_state:draw()
    d:draw()
end

-- TODO enumerated ball movement angles: use it for bounces and for sticky paddle and for multi-ball

-- TODO debug overrides to simulate powertup take, etc, to override chances of powerup, etc

-- TODO deserialized brick patterns (i.e. "bxbxb/xbxbx/bxbxb")
-- TODO 2 chars per brick, so it will look more like level and allow for mor info stored like hardened 1s vs 2nd
-- TODO make pattern lines start left (instead of centered independently), because later I will need to easily find surrounding bricks by indices

-- TODO ball vs paddle bounce angle affected by paddle dx
-- TODO bounce angles only aligned with integer values (i.e. 2x1, 1x2, 2x1)
-- TODO honor angle ball approaches the paddle, modify in relation to that
-- TODO debug constant visualisation of bounce direction?

-- TODO combo chain with more and more points
-- TODO sfx higher and higher (with upper limit) during combo chain
-- TODO combo in status bar
-- TODO how to reset combo? Think about it in terms of multi-ball. Paddle and wall resets?

-- TODO glued (sticky) paddle on every live
-- TODO start direction taken from paddle movement (movement set permanently or only during movement?)
-- TODO or maybe start direction changing constantly over time, so you have to pick one? or maybe use Z to change?
-- TODO start direction indicator
-- TODO start direction indicator polished juicy

-- TODO bricks as nice sprites

-- TODO multiple levels
-- TODO continue score on levels
-- TODO level over screen similar to game over, but good job and X to continue
-- TODO custom menu item to skip level?

-- TODO regular bricks, but in various colors

-- TODO hardened brick (hit twice, two types to cover them instead of single type and a counter)
-- TODO hardened brick 1st hit SFX
-- TODO explosive brick do not count more than 2nd hit towards combo
-- TODO explosive brick do not break combo chain on 1st hit

-- TODO explosive brick
-- TODO explosive brick SFX
-- TODO explosive brick latency in chain reaction (maybe again with use of a special type for about to explode instead of a counter?)
-- TODO explosive brick do not count more than 1 towards combo? or do they?
-- TODO explosive brick count as single hit towards hardened bricks and makes other explosives explode

-- TODO indestructible brick (not counted towards level completion)
-- TODO indestructible brick: do not count towards combo, but also do not lose combo chain

-- TODO power-up type of a brick (randomly chosen type? under random bricks or not?)
-- TODO in a form of a sprite looking like a pill sprite with a letter on it, colors and letters depend on a type
-- TODO power-ups falling down
-- TODO power-ups falling down disappear on live lose
-- TODO power-ups disappear below bottom edge (use DEL to remove from list of actively visible power-ups?)
-- TODO power-up pickup SFX (one for appear, one for take? different for each type?)
-- TODO black power-up with PALT transparency change for the very moment of drawing it (and revert afterwards)
-- TODO one power-up overwrites another while 1st time has not passed yet?
-- TODO counter towards end of the current power-up
-- TODO H: +1 heart (what max cap to have? OK to generate L if max hearts are there?)
-- TODO E: extended/longer paddle (make sure no lock when extended on screen border. Extend one direction instead. Maybe do not randomly pick next E while already in E) Consider sprite for paddle so it will be easier to show extended
-- TODO R: reduced/shorter paddle (make its color look like something bad)
-- TODO G: glued (sticky) paddle (centered ball or on hit position? what then with ball too on the side so it overlap with a arena border? make sure other power ups continue on falling down, games doesn't pause. What if I catch another power-up while glued ball? Should it release in which direction? Also maybe no timer, but just works once?)
-- TODO S: super ball: continues through all bricks (except indestructible), continuing combo chain. Different ball color (or name it W wrecking ball?)
-- TODO M: multi ball: 2 more balls (or just 1?) at other available similar angles. What with combo counter? Losing 1 ball =/= live lost. OK to multi x multi x multi? What with glued paddle? Which one to multi on 2nd pickup, original or random of 2?

-- TODO screenshake: on what action?
-- TODO screenshake: rectfill instead of cls to move game arena as well

-- TODO blinking "press X" texts
-- TODO start screen on X: start SFX and do something with text and only then start the game

-- TODO fading mapping from color index to color: [0] 0 1 1 / 2 1 13 6 / 4 4 9 3 / 13 1 13 14
-- TODO maybe use this formula to make all colors fade over 5 steps? kmax = (p+j*1.46)/22 ??? See https://youtu.be/wxXeUJOeFvA?t=624 / j = current color / p = flr(mid(0, perc, 1)*100)
-- TODO fading on start press X

-- TODO ball trail: angle=rnd(), x+sin(angle)+r*0.6,y+cos(angle)*r*0.6, addparticle(x,y,age=15+rnd(15))
-- TODO ball trail: older particle = different color (disappear)
-- TODO different trail on super ball etc.

-- TODO brick destroyed particles: around + gravitation + disappear maybe too over short time
-- TODO brick hit flash: but count as destroyed already, while still visible
-- TODO brick hit bounced a little bit: but treat as in place in terms of collision?

-- TODO animate bricks falling down to form a level

-- TODO any new SFXs and effects in them?

-- TODO logo sprite on start screen

-- TODO collision on corner deflects both x and y

-- TODO: all levels clear screen

-- TODO: paddle movement speed trail lines

-- TODO: music: song for start screen
-- TODO: music: song for all levels clear screen
-- TODO: music: short music for level clear and for no more lives

-- TODO sash UI (ribbon across screen messages like a snackbar)
-- TODO sash UI: text comes from left, goes to right
-- TODO sash UI: level starts, pick up taken (i.e. +1 heart)
-- TODO sash UI: what with one message appearing while previous one still lasts?
-- TODO sash UI: when high combo, with random texts

-- TODO mention LazyDevs's version in README: https://www.lexaloffle.com/bbs/?pid=53977#p

-- TODO publish on BBS, link to it in README
-- TODO publish on itch, link to it in README
