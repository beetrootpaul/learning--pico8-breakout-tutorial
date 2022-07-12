new_gs_in_game = setmetatable({ }, {
    __call = function(self)
        return setmetatable({}, { __index = self })
    end
})

function new_gs_in_game:init()
    bricks:init()
    paddle:init()
    ball:init()
    lives:init()
    score:init()
end

function new_gs_in_game:update_and_get_next_state()
    paddle:update()
    is_ball_lost = ball:update()

    if is_ball_lost then
        return new_gs_game_over()
    end
    return self
end

function new_gs_in_game:draw()
    cls(u.colors.black)

    screen_game_area:draw()
    bricks:draw()
    paddle:draw()
    ball:draw()
    status_bar:draw()
end
