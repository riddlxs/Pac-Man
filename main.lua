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

local SimpleMusic = require("SimpleMusic")
local backgroundMusic
local moveDelay = 4 -- seconds
local moveAllowed = false
local startTime

function love.load()
    backgroundMusic = SimpleMusic.new("music/pacman.mp3")
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
    require "enemy"
    require "power"
    player = Player(372,669)
    enemy = Enemy(358,400)
    score = 0

    gameFont = love.graphics.newFont(30)

    objects = {player,enemy,Pellet(5,5),Pellet(6,5),Pellet(7,5),Pellet(8,5), Pellet(9, 5), Pellet(10, 5),Pellet(11, 5),Pellet(12, 5),Pellet(13, 5),
    Pellet(14, 5), Pellet(14, 6),Pellet(14, 7),Pellet(14, 8),Pellet(14, 9),Pellet(15, 9),Pellet(16, 9),Pellet(17, 9),Pellet(18, 9),Pellet(19, 9),Pellet(20, 9),
    Pellet(21, 9),Pellet(22, 9),Pellet(23, 9),Pellet(24, 9),Pellet(25, 9),Pellet(26, 9),Pellet(27, 9),Pellet(28, 9),Pellet(28, 8),Pellet(28, 7),Pellet(28, 6),
    Pellet(28, 5),Pellet(27, 5),Pellet(26, 5),Pellet(25, 5),Pellet(24, 5),Pellet(23, 5),Pellet(22, 5),Pellet(21, 5),Pellet(20, 5),Pellet(19, 5),Pellet(18, 5),
    Pellet(17, 5),Pellet(17, 6),Pellet(17, 7),Pellet(17, 8),Pellet(23, 6),Pellet(23, 7),Pellet(23, 8),Pellet(4,5),Pellet(3, 5),Pellet(8, 6),Pellet(8, 7),Pellet(8, 8),
    Pellet(8, 9),Pellet(3, 6),Pellet(3, 7),Pellet(3, 8),Pellet(3, 9),Pellet(3, 10),Pellet(3, 11),Pellet(3, 12),Pellet(4, 12),Pellet(5, 12),Pellet(6, 12),Pellet(7, 12),
    Pellet(8, 12),Pellet(8, 11),Pellet(8, 10),Pellet(7, 9),Pellet(6, 9),Pellet(5, 9),Pellet(4, 9),Pellet(9, 9),Pellet(10, 9),Pellet(11, 9),Pellet(12, 9),Pellet(13, 9),
    Pellet(8, 13),Pellet(8, 14),Pellet(8, 15),Pellet(8, 16),Pellet(8, 17),Pellet(8, 18),Pellet(8, 19),Pellet(8, 20),Pellet(8, 21),Pellet(8, 22),Pellet(8, 23),Pellet(8, 24),
    Pellet(8, 25),Pellet(8, 26),Pellet(8, 27),Pellet(8, 28),Pellet(8, 29),Pellet(8, 30),Pellet(1, 18),Pellet(2,18),Pellet(3,18),Pellet(4,18),Pellet(5,18),Pellet(6,18),
    Pellet(7,18),Pellet(5,24),Pellet(4,24),Pellet(3,24),Pellet(7,24),Pellet(6,24),Pellet(3,25),Pellet(3,26),Pellet(3,27),Pellet(4,27),Pellet(5,27),Pellet(5,28),
    Pellet(5,29),Pellet(5,30),Pellet(4,30),Pellet(3,30),Pellet(6,30),Pellet(7,30),Pellet(3,31),Pellet(3,32),Pellet(3,33),Pellet(4,33),Pellet(5,33),Pellet(6,33),
    Pellet(7,33),Pellet(8,33),Pellet(9,33),Pellet(10,33),Pellet(11,33),Pellet(12,33),Pellet(13,33),Pellet(14,33),Pellet(15,33),Pellet(16,33),Pellet(17,33),Pellet(18,33),
    Pellet(19,33),Pellet(20,33),Pellet(21,33),Pellet(22,33),Pellet(23,33),Pellet(24,33),Pellet(25,33),Pellet(26,33),Pellet(27,33),Pellet(28,33),Pellet(28,32),Pellet(28,31),
    Pellet(28,30),Pellet(27,30),Pellet(26,30),Pellet(25,30),Pellet(24,30),Pellet(23,30),Pellet(23,29),Pellet(23,28),Pellet(23,27),Pellet(23,26),Pellet(23,25),Pellet(23,24),
    Pellet(23,23),Pellet(23,22),Pellet(23,21),Pellet(23,19),Pellet(23,18),Pellet(23,17),Pellet(23,16),Pellet(23,14),Pellet(23,12),Pellet(23,11),Pellet(23,10),Pellet(23,13),
    Pellet(21,24),Pellet(22,24),Pellet(24,24),Pellet(25,24),Pellet(11,30),Pellet(12,30),Pellet(13,30),Pellet(14,30),Pellet(14,31),Pellet(14,32),Pellet(17,32),
    Pellet(17,31),Pellet(17,30),Pellet(18,30),Pellet(19,30),Pellet(20,30),Pellet(20,28),Pellet(20,27),Pellet(21,27),Pellet(22,27),Pellet(26,27),Pellet(27,27),Pellet(28,27),
    Pellet(28,26),Pellet(28,25),Pellet(28,24),Pellet(27,24),Pellet(26,24),Pellet(26,28),Pellet(26,29),Pellet(16,27),Pellet(15,27),Pellet(14,27),Pellet(13,27),Pellet(12,27),
    Pellet(11,27),Pellet(10,27),Pellet(9,27),Pellet(16,27),Pellet(17,27),Pellet(18,27),Pellet(19,27),Pellet(11,28),Pellet(11,24),Pellet(10,24),Pellet(9,24),
    Pellet(12,24),Pellet(14,24),Pellet(14,25),Pellet(14,26),Pellet(17,26),Pellet(17,25),Pellet(17,24),Pellet(18,24),Pellet(19,24),Pellet(20,24),Pellet(20,19),Pellet(20,20),
    Pellet(20,21),Pellet(20,22),Pellet(20,23),Pellet(20,17),Pellet(20,16),Pellet(20,15),Pellet(20,18),Pellet(21,18),Pellet(22,18),Pellet(24,18),Pellet(25,18),Pellet(26,18),
    Pellet(27,18),Pellet(28,18),Pellet(29,18),Pellet(30,18),Pellet(13,15),Pellet(12,15),Pellet(11,15),Pellet(14,15),Pellet(15,15),Pellet(16,15),Pellet(17,15),
    Pellet(18,15),Pellet(11,16),Pellet(11,17),Pellet(11,18),Pellet(11,20),Pellet(11,21),Pellet(11,22),Pellet(11,23),Pellet(10,18),Pellet(9,18),Pellet(11,10),
    Pellet(11,11),Pellet(11,12),Pellet(13,12),Pellet(14,12),Pellet(14,13),Pellet(14,14),Pellet(17,13),Pellet(17,14),Pellet(18,12),Pellet(19,12),Pellet(20,12),
    Pellet(20,11),Pellet(20,10),Pellet(24,12),Pellet(25,12),Pellet(26,12),Pellet(27,12),Pellet(28,12),Pellet(28,11),Pellet(28,10),Pellet(15,21),Pellet(14,21),
    Pellet(13,21),Pellet(12,21),Pellet(16,21),Pellet(17,21),Pellet(18,21),Pellet(19,21),



    Power(23,15),Power(23,20),Power(13,24),Power(17,12),Power(12,12),Power(11,19),Power(11,29),Power(20,29),Power(19,15),
    
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
        Wall(1,32),Wall(29,32),Wall(0,16),Wall(-1,16),Wall(0,19),Wall(-1,19),Wall(29,16),Wall(29,16),Wall(29,19),Wall(29,19),
        Wall(1,33),Wall(29,33),
        Wall(1,34),Wall(2,34),Wall(3,34),Wall(4,34),Wall(5,34),Wall(6,34),Wall(7,34),Wall(8,34),Wall(9,34),Wall(10,34),Wall(11,34),Wall(12,34),Wall(13,34),Wall(14,34),Wall(15,34),Wall(16,34),Wall(17,34),Wall(18,34),Wall(19,34),Wall(20,34),Wall(21,34),Wall(22,34),Wall(23,34),Wall(24,34),Wall(25,34),Wall(26,34),Wall(27,34),Wall(28,34),Wall(29,34),
    }
end

function love.update(dt)
    enemy:update(dt)
    for i, v in ipairs(objects) do 
        v:update(dt)
    end

    local loop = true
    local limit = 0

    while loop do
        loop = false
    
        limit = limit + 1
        if limit > 100 then 
            break 
        end

        for i = 1, #objects - 1 do
            for j = i + 1, #objects do
                local collision = objects[i]:resolveCollision(objects[j])
                if collision then
                    loop = true
                end
            end
        end
    end
end


function love.draw()
    for i, v in ipairs(objects) do
        v:draw()
    end
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. score, 10, 10)
end

function checkCollision(a, b)
    return a.x < b.x + b.image:getWidth() and
           b.x < a.x + a.width and
           a.y < b.y + b.image:getHeight() and
           b.y < a.y + a.height
end