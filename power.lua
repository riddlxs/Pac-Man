Power = Entity:extend()

function Power:new(x, y)
    Power.super.new(self, (x * 25) - 3, (y * 25) - 3, "images/bigcircle.png")
    self.strength = 1
    self.ignoreCollision = true
end

function Power:update(dt)
    Power.super.update(self, dt)

    local dx = math.abs((player.x + 15) - (self.x + 3))
    local dy = math.abs((player.y + 15) - (self.y + 3))

    if (dx <= 25) and (dy <= 25) then
        self.x = self.x -2000
        self.y = self.y -2000
        
        score = score + 10
        print("Pellet collided with player!") --debug stuffs :)
        print("New Score: " .. score)
        player.power = true
    end
end
