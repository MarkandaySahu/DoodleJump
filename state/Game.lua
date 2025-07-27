local love = require"love"
local Sfx = require"components/sfx"
function Game()
    local pause = love.graphics.newImage("assets/UI/pause.png")
    local star = love.graphics.newImage("assets/UI/star.png")
    local trophy = love.graphics.newImage("assets/UI/trophy.png")
    local jump_img = love.graphics.newImage("assets/UI/jumper.png")
    local tile_width = 150
    local tile_height = 20
    local sfx = Sfx()
    return
    {
        opacity = 0.4,
        paused = true,
        score = 0,
        jump_dist = 250,
        translate_dist = 140,
        doodle_p = {image = nil, x = nil, y = 700},
        tiles = {
            {y=90,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=240,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=390,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=540,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=690,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=840,x={},initial_position=nil,tween_timer=0,score=nil},
            {y=990,x={},initial_position=nil,tween_timer=0,score=nil}},
        insertTiles =function (self)
            for _, value in pairs(self.tiles) do
                for i = 1,2 do
                    local x = math.random(0,3)
                    table.insert(value.x,x*tile_width+5)
                end
            end
        end,
        checkCollision = function (self)
            for _, value in pairs(self.tiles) do
                if translate_tween_dist then
                    value.initial_position = value.y
                end
                for i = 1,2 do
                    if (self.doodle_p.y + 60) > value.y and (self.doodle_p.y + 60 ) < (value.y + 20) and (self.doodle_p.x < value.x[i] + 150) and (self.doodle_p.x + 50) > (value.x[i]) then
                        if jump_timer == 0 then
                            _G.final_position = (game.doodle_p.y - self.jump_dist)--for position tweening
                            if value.score=="star" then
                                self.score = self.score + 1
                                value.score=nil
                                sfx:playFX("point")
                            elseif value.score=="trophy" then
                                self.score = self.score + 5
                                value.score=nil
                                sfx:playFX("point")
                            end
                            return true
                        end
                    end
                end
            end
            translate_tween_dist = false
        end,
        draw = function (self)
            if self.paused then
                love.graphics.setColor(1,1,1,1.4-self.opacity)
                love.graphics.rectangle("line",10,390,590,200)
                love.graphics.draw(pause,180,400)
                love.graphics.print("Paused",280,430,0)
                love.graphics.print("[Esc] to play/pause",180,500,0)
                love.graphics.print("[Space] to jump ; [A]/[D] to move",80,550,0)
            end
            love.graphics.setColor(1,1,1,self.opacity)
            love.graphics.draw(self.doodle_p.image,self.doodle_p.x,self.doodle_p.y,0,1.5)
            love.graphics.draw(star,5,10,0,0.5,0.5)
            love.graphics.print(" "..self.score,50,25,0)
            --Draw the tiles
            for _, value in pairs(self.tiles) do
                for i = 1,2 do
                    love.graphics.rectangle("fill",value.x[i],value.y,tile_width,tile_height)
                    if value.jump then
                        love.graphics.draw(jump_img,value.x[i]+50,value.y-50,0,0.5,0.5)
                    elseif value.score == "star" then
                        love.graphics.draw(star,value.x[i]+50,value.y-50,0,0.5,0.5)
                    elseif value.score=="trophy" then
                        love.graphics.draw(trophy,value.x[i]+50,value.y-50,0,0.5,0.5)
                    end
                end
            end
        end
    }
end

return Game