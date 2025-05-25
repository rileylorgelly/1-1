---@class Vector
---@field x number
---@field y number

local vector = {}

function vector.new(x, y)
    return setmetatable({
        x = x or 0,
        y = y or 0
    }, {__index = vector})
end

function vector:magnitude()
    return math.sqrt(
        self.x * self.x -- x^2
        + self.y * self.y -- y^2
    )
end

function vector:unit()
    local mag = self:magnitude()
    if mag == 0 then
        return vector.new(0, 0)
    end
    return vector.new(self.x / mag, self.y / mag)
end

return vector