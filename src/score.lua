new_score = setmetatable({}, {
    __call = function(self)
        local score = {
            points = 0,
        }
        return setmetatable(score, { __index = self })
    end
})

function new_score:add_points(amount)
    self.points = self.points + amount
end
