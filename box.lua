Box = Entity:extend()

function Box:new(x, y)
    Box.super.new(self, x, y, "images/box.png")
    self.moveSpeed = 200
end
