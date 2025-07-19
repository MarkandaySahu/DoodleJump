local love = require"love"

function Menu()
    local home = love.graphics.newImage("assets/UI/home.png")
    local play = love.graphics.newImage("assets/UI/play.png")
    local settings = love.graphics.newImage("assets/UI/gear.png")
    local info = love.graphics.newImage("assets/UI/information.png")
    local exit = love.graphics.newImage("assets/UI/exit.png")
    return
    {
        draw = function ()
            love.graphics.draw(home,500,50)
            love.graphics.setFont(love.graphics.newFont(64))
            love.graphics.print("DoodleJump",90,60,0)

            love.graphics.draw(play,10,250)
            love.graphics.draw(settings,10,400)
            love.graphics.draw(info,10,550)
            love.graphics.draw(exit,10,700)

            love.graphics.setFont(love.graphics.newFont(48))
            if menuBox==1 then
                love.graphics.rectangle("line",10,250,590,100)
                love.graphics.print("Play",150,280,0)
            elseif menuBox==2 then
                love.graphics.rectangle("line",10,400,590,100)
                love.graphics.print("Settings",150,430,0)
            elseif menuBox==3 then
                love.graphics.rectangle("line",10,550,590,100)
                love.graphics.print("Info",150,580,0)
            elseif menuBox==4 then
                love.graphics.rectangle("line",10,700,590,100)
                love.graphics.print("Exit",150,730,0)
            end
            love.graphics.setFont(love.graphics.newFont(24))
            love.graphics.print("up/down to navigate & Enter to select",80,900,0)

        end
    }
end

return Menu