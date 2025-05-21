---@class Vector2
---@field x number
---@field y number

---@type {[string]: Vector2}
local DIRECTIONS = {
    d = {
        x = 1,
        y = 0
    },
    a = {
        x = -1,
        y = 0
    }
}

local fps = "0.0"
local fpsColor = {1, 1, 1, 1}
local actualFps = 0
---@type {health: number, speed: number, position: Vector2, characterType: number}
local Player = {
    health = 100,
    speed = 50,
    characterType = 1, -- unused atm until i get assets.
    position = {
        x = 0,
        y = 0
    },
}

---@type Vector2
local textPosition = {
    x = 0,
    y = 0
}
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
local function lerpColor(t, r, g, b, a, r1, g1, b1, a1)
    return r + (t * (r1 - r)), g + (t * (g1 - g)), b + (t * (b1 - b)), a + (t * (a1 - a))
end

---@param args [any]
function love.load(args)
    love.window.setTitle("game")
    Player.position = {
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2
    }
end

---@param deltaTime number
function love.update(deltaTime)
    actualFps = 1 / deltaTime
    fps = string.format("FPS: %.1f", actualFps)



    for key, direction in pairs(DIRECTIONS) do
        if love.keyboard.isDown(key) then
            Player.position = {
                x = Player.position.x + direction.x * Player.speed * deltaTime,
                y = Player.position.y + direction.y * Player.speed * deltaTime
            }
        end
    end

    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.print(fps, unpack(textPosition))
    love.graphics.circle("fill", Player.position.x, Player.position.y, 10)
    
end