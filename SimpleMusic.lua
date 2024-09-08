local SimpleMusic = {}
SimpleMusic.__index = SimpleMusic

function SimpleMusic.new(file)
    local self = setmetatable({}, SimpleMusic)
    self.source = love.audio.newSource(file, "stream")
    self.source:setLooping(false) --did not have enough time to edit music, looping it restarted the start too, it became annoying
    self.source:play()
    return self
end
return SimpleMusic
