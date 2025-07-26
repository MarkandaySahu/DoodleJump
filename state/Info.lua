local love = require"love"

function Info()
    local back = love.graphics.newImage("assets/UI/back.png")
    local star = love.graphics.newImage("assets/UI/star.png")
    local jump = love.graphics.newImage("assets/UI/jumper.png")
    local trophy = love.graphics.newImage("assets/UI/trophy.png")
    return{
        draw=function ()
            love.graphics.draw(back,10,40)
            love.graphics.setFont(love.graphics.newFont(64))
            love.graphics.print("DoodleInfo",120,50,0)
            love.graphics.setFont(love.graphics.newFont(24))

            love.graphics.draw(trophy,10,340,0,0.7,0.7)
            love.graphics.print("Grants you 5",90,370,0)
            love.graphics.draw(star,248,355,0,0.5,0.5)

            love.graphics.draw(jump,10,440,0,0.7,0.7)
            love.graphics.print("Jump Power-Up",90,470,0)

            love.graphics.draw(star,10,240,0,0.7,0.7)
            love.graphics.print("Score Point",90,270,0)

            love.graphics.print("[Esc to menu]",200,970,0)
        end
    }
end
return Info