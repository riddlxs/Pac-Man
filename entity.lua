Entity = Object:extend()

function Entity:new(x,y, image_path)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage(image_path)
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.last = {}
    self.last.x = self.x
    self.last.y = self.y

    self.strength = 0
    self.tempStrength = 0
end 

function Entity:update()
    self.last.x = self.x
    self.last.y = self.y
    self.tempStrength = self.strength
end

function Entity:wasVerticallyAlligned(otherEntity)
    return self.last.y < otherEntity.last.y + otherEntity.height and self.last.y  + self.height > otherEntity.last.y
end

function Entity:wasHorizontallyAlligned(otherEntity)
    return self.last.x < otherEntity.last.x + otherEntity.width and self.last.x  + self.width > otherEntity.last.x
end


function Entity:resolveCollision(otherEntity)
    if self.strength > otherEntity.strength then
        otherEntity:resolveCollision(self)
        --return because we do not want to continue this function
        return
    end

    if self:checkCollision(otherEntity) then

        self.tempStrength = otherEntity.tempStrength

        if self:wasVerticallyAlligned(otherEntity) then
            if self.x + self.width/2 < otherEntity.x + otherEntity.width/2 then
                local pushback = self.x + self.width - otherEntity.x 
                self.x = self.x - pushback
            else 
                local pushback = otherEntity.x + otherEntity.width - self.x
                --pushback = the left side of player, right side of wall
                self.x = self.x + pushback
            end

        elseif self:wasHorizontallyAlligned(otherEntity) then
            if self.y + self.height/2 < otherEntity.y + otherEntity.height/2 then
                --pushback = the bottom side of player, top side of wall
                local pushback = self.y + self.height - otherEntity.y
                self.y = self.y - pushback
            else 
                local pushback = otherEntity.y + otherEntity.height - self.y
                --pushback = the top side of player, bottom side of wall
                self.y = self.y + pushback
            end
        end
        
        return true
    end
        return false
end

function Entity:draw()
    love.graphics.draw(self.image, self.x, self.y)

end 

function Entity:checkCollision(otherEntity)
    return self.x + self.width > otherEntity.x
    and self.x < otherEntity.x + otherEntity.width
    and self.y + self.height > otherEntity.y
    and self.y < otherEntity.y + otherEntity.height
end 