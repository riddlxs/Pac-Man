if arg[2] == "debug" then
    require("lldebugger").start()
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2);
    else
        return love_errorhandler(msg)
    end
end

function love.load()
    screen_width = 775
    screen_height = 900
    love.window.setTitle("PacManCopyMadeByLianaHockin")
    love.window.setMode(screen_width, screen_height)
    Object = require "classic"
    require "entity"
    require "wall"
    require "player"
    require "box"
    require "pellet"

    gameFont = love.graphics.newFont(30)
    
    player = Player (372,669)
    --box = Box(400,150)
    walls = {
        Wall(1,3),Wall(2,3),Wall(3,3),Wall(4,3),Wall(5,3),Wall(6,3),Wall(7,3),Wall(8,3),Wall(9,3),Wall(10,3),Wall(11,3),Wall(12,3),Wall(13,3),Wall(14,3),Wall(15,3),Wall(16,3),Wall(17,3),Wall(18,3),Wall(19,3),Wall(20,3),Wall(21,3),Wall(22,3),Wall(23,3),Wall(24,3),Wall(25,3),Wall(26,3),Wall(27,3),Wall(28,3),Wall(29,3),
        Wall(1,4),Wall(15,4),Wall(29,4),
        Wall(1,5),Wall(15,5),Wall(29,5),
        Wall(1,6),Wall(4,6),Wall(5,6),Wall(6,6),Wall(9,6),Wall(10,6),Wall(11,6),Wall(12,6),Wall(15,6),Wall(18,6),Wall(19,6),Wall(20,6),Wall(21,6),Wall(24,6),Wall(25,6),Wall(26,6),Wall(29,6),
        Wall(1,7),Wall(4,7),Wall(5,7),Wall(6,7),Wall(9,7),Wall(10,7),Wall(11,7),Wall(12,7),Wall(15,7),Wall(18,7),Wall(19,7),Wall(20,7),Wall(21,7),Wall(24,7),Wall(25,7),Wall(26,7),Wall(29,7),
        Wall(1,8),Wall(29,8),
        Wall(1,9),Wall(29,9),
        Wall(1,10),Wall(4,10),Wall(5,10),Wall(6,10),Wall(9,10),Wall(12,10),Wall(13,10),Wall(14,10),Wall(15,10),Wall(16,10),Wall(17,10),Wall(18,10),Wall(21,10),Wall(24,10),Wall(25,10),Wall(26,10),Wall(29,10),
        Wall(1,11),Wall(9,11),Wall(15,11),Wall(21,11),Wall(29,11),
        Wall(1,12),Wall(9,12),Wall(15,12),Wall(21,12),Wall(29,12),
        Wall(1,13),Wall(2,13),Wall(3,13),Wall(4,13),Wall(5,13),Wall(6,13),Wall(9,13),Wall(10,13),Wall(11,13),Wall(12,13),Wall(15,13),Wall(18,13),Wall(19,13),Wall(20,13),Wall(21,13),Wall(24,13),Wall(25,13),Wall(26,13),Wall(27,13),Wall(28,13),Wall(29,13),
        Wall(6,14),Wall(9,14),Wall(21,14),Wall(24,14),
        Wall(6,15),Wall(9,15),Wall(21,15),Wall(24,15),
        Wall(1,16),Wall(2,16),Wall(3,16),Wall(4,16),Wall(5,16),Wall(6,16),Wall(9,16),Wall(12,16),Wall(13,16),Wall(17,16),Wall(18,16),Wall(21,16),Wall(24,16),Wall(25,16),Wall(26,16),Wall(27,16),Wall(28,16),Wall(29,16),
        Wall(12,17),Wall(18,17),
        Wall(12,18),Wall(18,18),
        Wall(1,19),Wall(2,19),Wall(3,19),Wall(4,19),Wall(5,19),Wall(6,19),Wall(9,19),Wall(12,19),Wall(13,19),Wall(14,19),Wall(15,19),Wall(16,19),Wall(17,19),Wall(18,19),Wall(21,19),Wall(24,19),Wall(25,19),Wall(26,19),Wall(27,19),Wall(28,19),Wall(29,19),
        Wall(6,20),Wall(9,20),Wall(21,20),Wall(24,20),
        Wall(6,21),Wall(9,21),Wall(21,21),Wall(24,21),
        Wall(1,22),Wall(2,22),Wall(3,22),Wall(4,22),Wall(5,22),Wall(6,22),Wall(9,22),Wall(12,22),Wall(13,22),Wall(14,22),Wall(15,22),Wall(16,22),Wall(17,22),Wall(18,22),Wall(21,22),Wall(24,22),Wall(25,22),Wall(26,22),Wall(27,22),Wall(28,22),Wall(29,22),
        Wall(1,23),Wall(15,23),Wall(29,23),
        Wall(1,24),Wall(15,24),Wall(29,24),
        Wall(1,25),Wall(4,25),Wall(5,25),Wall(6,25),Wall(9,25),Wall(10,25),Wall(11,25),Wall(12,25),Wall(15,25),Wall(18,25),Wall(19,25),Wall(20,25),Wall(21,25),Wall(24,25),Wall(25,25),Wall(26,25),Wall(29,25),
        Wall(1,26),Wall(6,26),Wall(24,26),Wall(29,26),
        Wall(1,27),Wall(6,27),Wall(24,27),Wall(29,27),
        Wall(1,28),Wall(2,28),Wall(3,28),Wall(6,28),Wall(9,28),Wall(12,28),Wall(13,28),Wall(14,28),Wall(15,28),Wall(16,28),Wall(17,28),Wall(18,28),Wall(21,28),Wall(24,28),Wall(27,28),Wall(28,28),Wall(29,28),
        Wall(1,29),Wall(9,29),Wall(15,29),Wall(21,29),Wall(29,29),
        Wall(1,30),Wall(9,30),Wall(15,30),Wall(21,30),Wall(29,30),
        Wall(1,31),Wall(4,31),Wall(5,31),Wall(6,31),Wall(7,31),Wall(8,31),Wall(9,31),Wall(10,31),Wall(11,31),Wall(12,31),Wall(15,31),Wall(18,31),Wall(19,31),Wall(20,31),Wall(21,31),Wall(22,31),Wall(23,31),Wall(24,31),Wall(25,31),Wall(26,31),Wall(29,31),
        Wall(1,32),Wall(29,32),
        Wall(1,33),Wall(29,33),
        Wall(1,34),Wall(2,34),Wall(3,34),Wall(4,34),Wall(5,34),Wall(6,34),Wall(7,34),Wall(8,34),Wall(9,34),Wall(10,34),Wall(11,34),Wall(12,34),Wall(13,34),Wall(14,34),Wall(15,34),Wall(16,34),Wall(17,34),Wall(18,34),Wall(19,34),Wall(20,34),Wall(21,34),Wall(22,34),Wall(23,34),Wall(24,34),Wall(25,34),Wall(26,34),Wall(27,34),Wall(28,34),Wall(29,34   ),
    }
    pellet = {
        Pellet(3,6)
    }

    objects = {}
    table.insert(objects, player)
    for _, wall in ipairs(walls) do
        table.insert(objects, wall)
    end
    for _, pellet in ipairs(pellet) do
            table.insert(objects, pellet)
    end
    table.insert(objects, box)
end

function love.update(dt)
    for i,v in ipairs(objects) do 
        v:update(dt)
    end

    local loop = true
    local limit = 0

    while loop do -- be careful with while loops, can be an infinite
    loop = false --fixes infinite while loop, safety measure
    
    limit = limit + 1
    if limit > 100 then 
        break 
        --doing this because we want to check if the limit is greater than 100, if so, we want break out of while loop
    end
    
    for i=1, #objects-1 do --only runs twice because its objects -1 is 2 
    
            for j = i+1, #objects do
                local collision = objects[i]:resolveCollision(objects[j])
                    if collision then
                        loop = true
                end
            end
        end
    end
    if pellet.isVisible and checkCollision(player, pellet) then
        pellet.isVisible = false
    end
end



        -- quick efficient code v = value, i = index
        --v:update(dt)

        --for j,w in ipairs(objects) do --j and w because its simple, next letters in alphabet, theyre just variables
            --if v ~= w then
                --v:resolveCollision(w)
            --end
        --end
    --end
--end

function love.draw()
    for i,v in ipairs(objects) do
        v:draw()
    end
    if pellet.isVisible then
        love.graphics.draw(pellet.image, pellet.x, pellet.y)
    end
end

    
    --love.graphics.setColor(1,1,0)
    --love.graphics.setFont(gameFont)
   --Ready = love.graphics.print("READY!", 336 , 510)
   function checkCollision(a, b)
    return a.x < b.x + b.image:getWidth() and
           b.x < a.x + a.width and
           a.y < b.y + b.image:getHeight() and
           b.y < a.y + a.height
end
