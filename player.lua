Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y, "images/slime2.png")
    self.moveSpeed = 110
    self.strength = 1
    self.power = false
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
    
    if (self.x < -12.5) and (self.y > 400) and (self.y < 450) then
       self.x = 737.5
    elseif (self.x > 737.5)and (self.y > 400) and (self.y < 450) then
       self.x = -12.5
    end

    local dx1 = math.abs((self.x + 15) - (enemy.x + 3))
    local dy1 = math.abs((self.y + 15) - (enemy.y + 3))

    if (dx1 <= 25) and (dy1 <= 25) and (self.power == true) then
        enemy.x = 358
        enemy.y = 400
        enemy.moveSpeed = 50
        self.power = false
    end
end