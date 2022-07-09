lives = {
    -- -- -- -- -- -- -- --
    -- public properties --
    -- -- -- -- -- -- -- --
    max = 3,
    left = 0,
}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function lives:init()
    self.left = self.max
end

function lives:lose_one()
    self.left = self.left - 1
end

function lives:is_any_left()
    return self.left > 0
end