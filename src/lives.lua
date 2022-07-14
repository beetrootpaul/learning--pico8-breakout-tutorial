new_lives = setmetatable({}, {
    __call = function(self)
        local lives = {
            max = 3,
        }
        lives.left = lives.max
        return setmetatable(lives, { __index = self })
    end
})

function new_lives:is_any_left()
    return self.left > 0
end

function new_lives:lose_one()
    sfx(u.sfxs.live_lost)
    self.left = self.left - 1
end