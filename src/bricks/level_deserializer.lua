level_deserializer = {}

function level_deserializer:deserialize(serialized_level, game_area)
    local level = {}

    for row_number, serialized_level_row in pairs(split(serialized_level, "\n")) do
        local level_row = self:deserialize_row(row_number, serialized_level_row, game_area)
        for i = 1, #level_row do
            add(level, level_row[i])
        end
    end

    return level
end

function level_deserializer:deserialize_row(row, serialized_level_row, game_area)
    local input = u.trim(serialized_level_row)
    local output = {}

    local brick_w = u.sprites.bricks.w
    local brick_h = u.sprites.bricks.h
    local brick_gap = 1
    local columns = #input
    local initial_x = game_area.w / 2 - (columns * (brick_w + brick_gap) - brick_gap) / 2
    local initial_y = 7

    for column = 1, columns do
        local brick_type = sub(input, column, column)
        if brick_type == '-' then
            add(output, new_brick_regular({
                offset_x = game_area.x,
                offset_y = game_area.y,
                x = initial_x + (column - 1) * (brick_w + brick_gap),
                y = initial_y + (row - 1) * (brick_h + brick_gap),
                w = brick_w,
                h = brick_h,
            }))
        elseif brick_type == '=' then
            add(output, new_brick_hardened({
                offset_x = game_area.x,
                offset_y = game_area.y,
                x = initial_x + (column - 1) * (brick_w + brick_gap),
                y = initial_y + (row - 1) * (brick_h + brick_gap),
                w = brick_w,
                h = brick_h,
            }))
        elseif brick_type == '#' then
            add(output, new_brick_indestructible({
                offset_x = game_area.x,
                offset_y = game_area.y,
                x = initial_x + (column - 1) * (brick_w + brick_gap),
                y = initial_y + (row - 1) * (brick_h + brick_gap),
                w = brick_w,
                h = brick_h,
            }))
        end
    end

    return output
end