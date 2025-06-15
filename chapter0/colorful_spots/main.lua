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
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(gaussian_random(),
                           gaussian_random(),
                           gaussian_random(),
                           0.5)
    local x = gaussian_random(WIDTH / 2, 60)
    local y = gaussian_random(HEIGHT / 2, 60)
    local radius = gaussian_random(5, 1)
    love.graphics.circle("fill", x, y, radius)

    love.graphics.setCanvas()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(canvas, 0, 0)

    love.timer.sleep(0.1)
end
