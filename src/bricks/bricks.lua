new_bricks = setmetatable({}, {
    __call = function(self, params)
        local bricks = {
            _list = {},
            _game_area = params.game_area,
        }

        local serialized_level = u.serialized_levels[1]
        bricks._list = level_deserializer:deserialize(serialized_level, bricks._game_area)

        return setmetatable(bricks, { __index = self })
    end
})

function new_bricks:draw()
    self:for_each_visible_brick(function(brick)
        brick:draw()
    end)
end

function new_bricks:for_each_visible_brick(callback)
    for _, brick in pairs(self._list) do
        if brick.visible then
            callback(brick)
        end
    end
end
