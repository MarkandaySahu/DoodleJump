local love = require"love"

function Ended()
    local medal = love.graphics.newImage("assets/UI/medal2.png")
    return
    {
        draw = function ()
            love.graphics.setFont(love.graphics.newFont(64))
            love.graphics.print("Game Over",120,330,0)
            love.graphics.setFont(love.graphics.newFont(24))
            love.graphics.draw(medal,205,420,0,0.5,0.5)
            love.graphics.print("Score: "..game.score,250,430,0)
            love.graphics.print("[Esc] to menu",210,530,0)
        end
    }
end

return Ended