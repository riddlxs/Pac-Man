Pellet = Entity:extend()

function Pellet:new(x,y)
    Pellet.super.new(self, x *25, y*25, "images/circle.png")
    self.image = love.graphics.newImage("images/circle.png")
    self.isVisible = true
end