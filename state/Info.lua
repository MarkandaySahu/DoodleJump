local love = require"love"

function Info()
    local back = love.graphics.newImage("assets/UI/back.png")
    local warn = love.graphics.newImage("assets/UI/warning.png")
    local ques = love.graphics.newImage("assets/UI/question.png")
    local trophy = love.graphics.newImage("assets/UI/trophy.png")
    local star = love.graphics.newImage("assets/UI/star.png")
    local cart = love.graphics.newImage("assets/UI/cart.png")
    local can = love.graphics.newImage("assets/UI/can1.png")
    local jump = love.graphics.newImage("assets/UI/jumper.png")
    local portal = love.graphics.newImage("assets/UI/portal.png")
    return{
        draw=function ()
            love.graphics.draw(back,10,40)
            love.graphics.setFont(love.graphics.newFont(64))
            love.graphics.print("DoodleInfo",120,50,0)

            love.graphics.draw(warn,10,140,0,0.7,0.7)
            love.graphics.setFont(love.graphics.newFont(24))
            love.graphics.print("Tile will break",90,170,0)

            love.graphics.draw(ques,10,240,0,0.7,0.7)
            love.graphics.print("any power-up can be there!",80,270,0)

            love.graphics.draw(trophy,10,340,0,0.7,0.7)
            love.graphics.print("Grants you 5",90,370,0)
            love.graphics.draw(star,248,355,0,0.5,0.5)

            love.graphics.setFont(love.graphics.newFont(36))
            love.graphics.print("Power-Ups Are...",30,450,0)
            love.graphics.setFont(love.graphics.newFont(24))

            love.graphics.draw(cart,10,540,0,0.7,0.7)
            love.graphics.print("take you to 1000m",90,570,0)

            love.graphics.draw(can,10,640,0,0.7,0.7)
            love.graphics.print("take you to 500m",90,670,0)

            love.graphics.draw(jump,10,740,0,0.7,0.7)
            love.graphics.print("jump to 100m high",90,770,0)

            love.graphics.draw(portal,10,840,0,0.7,0.7)
            love.graphics.print("teleports to another one",90,870,0)

            love.graphics.print("[Esc to menu]",200,970,0)
        end
    }
end
return Info