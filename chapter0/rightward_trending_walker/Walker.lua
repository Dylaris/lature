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
    local r = math.random()
    if r < 0.4 then
        -- 40% move rightward
        self.x = self.x + 1
    elseif r < 0.6 then
        -- 20% move leftward
        self.x = self.x - 1
    elseif r < 0.8 then
        -- 20% move upward
        self.y = self.y - 1
    else
        -- 20% move downward
        self.y = self.y + 1
    end
end

return Walker
