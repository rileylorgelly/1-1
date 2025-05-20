---@class Vector2
---@field x number
---@field y number

local fps = "0"

---@type Vector2
local textPosition = {
    x = 0,
    y = 0
}

-- ---@param args [any]
-- function love.load(args)

-- end

--- @param deltaTime number
function love.update(deltaTime)
    fps = string.format("FPS: %.2f", 1 / deltaTime)
end

function love.draw()
    love.graphics.print(fps, unpack(textPosition))
end