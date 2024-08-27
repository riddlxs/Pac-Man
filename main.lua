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
    screen_width = 1050
    screen_height = 1300
    love.window.setTitle("PacManCopyMadeByLianaHockin")
    love.window.setMode(screen_width, screen_height)
    Object = require "classic"
    require "entity"
    require "wall"
    require "player"
    require "box"

    player = Player (360,250)
    --box = Box(400,150)

    walls = {
        Wall(0,3),Wall(1,3),Wall(2,3),Wall(3,3),Wall(4,3),Wall(5,3),Wall(6,3),Wall(7,3),Wall(8,3),Wall(9,3),Wall(10,3),Wall(11,3),
        Wall(12,3),Wall(13,3),Wall(14,3),Wall(15,3),Wall(16,3),Wall(17,3),Wall(18,3),Wall(19,3),Wall(20,3),
        Wall(0,4),Wall(10,4),Wall(20,4),
        Wall(0,5),Wall(10,5),Wall(20,5),
        Wall(0,6),Wall(20,6),
        Wall(0,7),Wall(20,7),
        Wall(0,8),Wall(20,8),
        Wall(0,9),Wall(1,9),Wall(2,9),Wall(3,9),Wall(20,9),
        Wall(3,10),
        Wall(3,11),
        Wall(3,12),
        Wall(2,12),Wall(1,12),Wall(0,12),
        Wall(0,15),
    }

    objects = {}
    table.insert(objects, player)
    for _, wall in ipairs(walls) do
        table.insert(objects, wall)
    end
    --table.insert(objects, wall)
    --table.insert(objects, wall2)
    --table.insert(objects, wall3)
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
end