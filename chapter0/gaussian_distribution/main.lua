local function gaussian_random(mean, stddev)
    local function generate() 
        local u1 = math.random()
        local u2 = math.random()
        local z0 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
        return z0
    end

    mean = mean or 0
    stddev = stddev or 1
    return mean + generate()*stddev
end

function love.load()
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    love.graphics.setBackgroundColor(1, 1, 1)
    canvas = love.graphics.newCanvas(WIDTH, HEIGHT)
end

function love.draw()
    local x = gaussian_random(WIDTH / 2, 60)
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(0, 1, 1, 0.1)
    love.graphics.ellipse("fill", x, HEIGHT / 2, 64, 32)
    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0)
end

