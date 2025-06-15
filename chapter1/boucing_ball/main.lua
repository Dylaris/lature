local Vector = require("Vector")

local ball = {}

function ball:checkCollision()
    if self.location.x - self.radius < 0 or
       self.location.x + self.radius > WIDTH then 
       self.velocity.x = -self.velocity.x
    end
    if self.location.y - self.radius < 0 or
       self.location.y + self.radius > HEIGHT then 
       self.velocity.y = -self.velocity.y
    end
end

function love.load()
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    love.graphics.setBackgroundColor(1, 1, 1)

    ball.location = Vector:new(WIDTH/2, HEIGHT/2)
    ball.velocity = Vector:new(0, 0)
    ball.acceleration = Vector:new(0, 0)
    ball.radius = 20
    ball.trail = {}

    NR_TRAILS = 50
end

function love.keypressed(key)
    if key == "up" then
        ball.acceleration.y = ball.acceleration.y - 0.001
    end
    if key == "down" then
        ball.acceleration.y = ball.acceleration.y + 0.001
    end
    if key == "left" then
        ball.acceleration.x = ball.acceleration.x - 0.001
    end
    if key == "right" then
        ball.acceleration.x = ball.acceleration.x + 0.001
    end
end

function love.update(dt)
    ball:checkCollision()

    table.insert(ball.trail, Vector:new(ball.location.x, ball.location.y))

    if #ball.trail > NR_TRAILS then
        table.remove(ball.trail, 1)
    end

    ball.velocity = ball.velocity + ball.acceleration
    ball.velocity:limit(10)
    local ds = ball.velocity * 100*dt
    ball.location = ball.location + ds
end

function love.draw()
    -- draw trails
    for i, trail in ipairs(ball.trail) do
        local alpha = 0.2 * i/NR_TRAILS
        love.graphics.setColor(0, 0, 0, alpha)
        love.graphics.circle("fill", trail.x, trail.y, ball.radius)
    end

    -- draw current ball
    love.graphics.setColor(0, 0, 0)
    love.graphics.circle("fill", ball.location.x, ball.location.y, ball.radius)
end
