function love.load()
    WIDTH = love.graphics.getWidth()
    HEIGHT = love.graphics.getHeight()

    random_counts = {}
    max_count = 20
    for i = 1, max_count do
        random_counts[i] = 0
    end
end

function love.update()
    local index = math.random(max_count)
    random_counts[index] = random_counts[index] + 1
end

function love.draw()
    local rect_width = WIDTH / max_count
    for i = 1, max_count do
        local rect_height = random_counts[i]
        love.graphics.rectangle("fill", (i-1)*rect_width, HEIGHT-rect_height,
                                        rect_width-1, rect_height)
    end
end
