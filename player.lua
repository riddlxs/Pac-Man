Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y, "images/slime2.png")
    self.moveSpeed = 150
end

function Player:update(dt)
    Player.super.update(self, dt)

    if love.keyboard.isDown("a") then
        self.x = self.x - self.moveSpeed * dt
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.moveSpeed * dt
    end
    if love.keyboard.isDown("w") then 
        self.y = self.y - self.moveSpeed * dt
    end
    if love.keyboard.isDown("s") then 
        self.y = self.y + self.moveSpeed * dt
    end
    if self.x < -12.5 then
        self.x = 737.5
    elseif self.x > 737.5 then
        self.x = -12.5
    end
    --love.timer.sleep(0.125)
    --self.x = math.max(0, math.min(self.x, windowWidth - self.width))
    --self.y = math.max(0, math.min(self.y, windowHeight - self.height))
end
