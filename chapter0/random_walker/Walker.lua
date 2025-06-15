local Walker = {}
Walker.__index = Walker

function Walker:new()
    local obj = {}
    setmetatable(obj, self)
    obj.x = WIDTH / 2
    obj.y = HEIGHT / 2
    obj.canvas = love.graphics.newCanvas(WIDTH, HEIGHT)
    return obj
end

function Walker:display()
    love.graphics.setCanvas(self.canvas)
    love.graphics.points(self.x, self.y)
    love.graphics.setCanvas()
    love.graphics.draw(self.canvas, 0, 0)
end

function Walker:step()
    local stepx = math.random(-1, 1)
    local stepy = math.random(-1, 1)
    self.x = self.x + stepx
    self.y = self.y + stepy
end

return Walker
