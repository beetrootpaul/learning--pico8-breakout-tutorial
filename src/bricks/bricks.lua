new_bricks = setmetatable({}, {
    __call = function(self, params)
        local bricks = {
            _list = level_deserializer:deserialize(params.serialized_level, params.game_area),
            _game_area = params.game_area,
        }
        return setmetatable(bricks, { __index = self })
    end
})

function new_bricks:for_each_visible_brick(callback)
    for _, brick in pairs(self._list) do
        if brick.visible then
            callback(brick)
        end
    end
end

function new_bricks:draw()
    self:for_each_visible_brick(function(brick)
        brick:draw()
    end)
end

function new_bricks:is_any_left()
    local is_any_visible = false
    for _, brick in pairs(self._list) do
        if brick.visible and brick.destructible then
            is_any_visible = true
        end
    end
    return is_any_visible
end