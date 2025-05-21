local module = {}

---@param t number
---@param r number 
---@param g number
---@param b number
---@param a number
---@param r1 number
---@param g1 number
---@param b1 number
---@param a1 number
---@return number, number, number, number
function module.lerpColor(t, r, g, b, a, r1, g1, b1, a1)
    return r + (r1 - r) * t,
           g + (g1 - g) * t,
           b + (b1 - b) * t,
           a + (a1 - a) * t
end

return module