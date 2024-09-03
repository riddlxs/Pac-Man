Pellet = Entity:extend()

function Pellet:new(x, y)
    Pellet.super.new(self, (x * 25) - 3, (y * 25) - 3, "images/circle.png")
    self.strength = 1
end

function Pellet:update(dt)
    Pellet.super.update(self, dt)

    -- Calculate the distance between the player and the pellet
    local dx = math.abs((player.x + 25) - (self.x + 3))
    local dy = math.abs((player.y + 25) - (self.y + 3))

    -- Check for collision
    if (dx <= 25) and (dy <= 25) then
        -- Move the pellet off-screen
        self.x = -2000
        self.y = -2000
        
        -- Increase the score
        score = score + 1
        
        -- Print debug information
        print("Pellet collided with player!")
        print("New Score: " .. score)
    end
end
