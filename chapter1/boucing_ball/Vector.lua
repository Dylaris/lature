local Vector = {}
Vector.__index = Vector

function Vector:new(x, y)
    local obj = {}
    setmetatable(obj, self)
    obj.x = x or 0
    obj.y = y or 0
    return obj
end

function Vector:mag()
    return math.sqrt(self.x*self.x + self.y*self.y)
end

function Vector:limit(n)
    n = (n < 0) and -n or n
    local mag = self:mag()
    if mag > n then
        self.x = self.x * n / mag
        self.y = self.y * n / mag
    end
end

Vector.__add = function(v1, v2)
    return Vector:new(v1.x+v2.x, v1.y+v2.y)
end

Vector.__sub = function(v1, v2)
    return Vector:new(v1.x-v2.x, v1.y-v2.y)
end

Vector.__mul = function(v, n)
    return Vector:new(v.x*n, v.y*n)
end

return Vector
