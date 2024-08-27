Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y, "images/player.png")
    self.moveSpeed = 200
    self.strength = 10
    --windowWidth, windowHeight = love.graphics.getDimensions()
end

function Player:update(dt)
    Player.super.update(self, dt)

    if love.keyboard.isDown("a") then
        self.x = self.x - self.moveSpeed * dt
    elseif love.keyboard.isDown("d") then
        self.x = self.x + self.moveSpeed * dt
    end

    if love.keyboard.isDown("w") then 
        self.y = self.y - self.moveSpeed * dt
    elseif love.keyboard.isDown("s") then 
        self.y = self.y + self.moveSpeed * dt
    end
    --self.x = math.max(0, math.min(self.x, windowWidth - self.width))
    --self.y = math.max(0, math.min(self.y, windowHeight - self.height))
end
