local Walker = require("Walker")

function love.load()
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    walker = Walker:new()
end

function love.draw()
    walker:step()
    walker:display()
end
