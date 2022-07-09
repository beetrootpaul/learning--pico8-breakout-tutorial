score = {
    -- -- -- -- -- -- -- --
    -- public properties --
    -- -- -- -- -- -- -- --
    points = 0,
}

-- -- -- -- -- -- --
-- public methods --
-- -- -- -- -- -- --

function score:init()
    self.points = 0
end

function score:add_point()
    self.points = self.points + 1
end
