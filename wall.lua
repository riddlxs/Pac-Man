Wall = Entity:extend()

function Wall:new(x,y)
    Wall.super.new(self, x *50, y*50, "images/wall.png")
    self.strength = 100
end