local love = require"love"

function Game()
    local doodle = love.graphics.newImage("assets/Doodle/NakedLightSkin.png")
    return
    {
        draw = function ()
            love.graphics.draw(doodle,50,50)
        end
    }
end

return Game