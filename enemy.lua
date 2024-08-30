Enemy = Entity:extend()

function Enemy:new(x, y)
    Enemy.super.new(self, x, y, "images/bat.png")
    self.speed = 110
end

function Enemy:update(dt)
    Enemy.super.update(self, dt)

    local dx = player.x - self.x
    local dy = player.y - self.y
    local distance = math.sqrt(dx * dx + dy * dy)

    if distance > 0 then
        local normDx = dx / distance
        local normDy = dy / distance
        
        self.x = self.x + normDx * self.speed * dt
        self.y = self.y + normDy * self.speed * dt
    end

    local window_width = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
    end

    local window_height = love.graphics.getHeight()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > window_height then
        self.y = window_height - self.height
    end
end
