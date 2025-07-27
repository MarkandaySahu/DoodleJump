local love = require"love"
require"components.simple-slider"
function Settings()
    local back = love.graphics.newImage("assets/UI/back.png")
    local texture = love.graphics.newImage("assets/Doodle/TextureTutorial.png")
    return
    {
        doodle = {
            {image = love.graphics.newImage("assets/Doodle/ClothedDarkSkin.png"), x = 50, select = true},
            {image = love.graphics.newImage("assets/Doodle/ClothedDarkSkin1.png"), x = 100, select = false},
            {image = love.graphics.newImage("assets/Doodle/ClothedDarkSkin2.png"), x = 150, select = false},
            {image = love.graphics.newImage("assets/Doodle/ClothedLightSkin.png"), x = 200, select = false},
            {image = love.graphics.newImage("assets/Doodle/ClothedLightSkin1.png"), x = 250, select = false},
            {image = love.graphics.newImage("assets/Doodle/ClothedLightSkin2.png"), x = 300, select = false},
            {image = love.graphics.newImage("assets/Doodle/NakedDarkSkin.png"), x = 350, select = false},
            {image = love.graphics.newImage("assets/Doodle/NakedLightSkin.png"), x = 400, select = false},
        },
        doodleSelect = false,
        volumeSlider = newSlider(310,225,200,0.2,0,1),--default value = 0.2, range = (0,1)
        difficulty = {
            select = true,
            normal = true,
            hard = false
        },
        draw = function (self)
            love.graphics.draw(back,10,40)
            love.graphics.setFont(love.graphics.newFont(64))
            love.graphics.print("Settings",150,50,0)

            love.graphics.setFont(love.graphics.newFont(36))
            love.graphics.print("Volume",50,200,0)
            self.volumeSlider:draw()

            if self.difficulty.select==true then
                love.graphics.setColor(0,0.5,0.5)
                love.graphics.print("Difficulty :",50,300,0)
                love.graphics.setColor(1,1,1)
            else
                love.graphics.print("Difficulty :",50,300,0)
            end
            love.graphics.print("Normal",280,300,0)
            love.graphics.print("Hard",450,300,0)
            if self.difficulty.normal == true then
                love.graphics.rectangle("line",270,300,150,50)
            else
                love.graphics.rectangle("line",440,300,110,50)
                love.graphics.setFont(love.graphics.newFont(20))
                love.graphics.print("less Stars",450,350,0)
            end

            love.graphics.setFont(love.graphics.newFont(36))
            love.graphics.draw(texture,40,400,0,0.15,0.15)
            if self.doodleSelect==true then
                love.graphics.setColor(0,0.5,0.5)
                love.graphics.print("SelectDoodle",250,550,0)
                love.graphics.setColor(1,1,1)
            else
                love.graphics.print("SelectDoodle",250,550,0)
            end

            for key, value in ipairs(self.doodle) do
                love.graphics.draw(value.image,value.x,620,0,1,1)
                if self.doodle[key].select == true then
                    love.graphics.rectangle("line",value.x - 10,610,50,50)
                end
            end
            love.graphics.setFont(love.graphics.newFont(20))
            love.graphics.print("use mouse to set volume and arrow keys for others.",50,940,0)
            love.graphics.setFont(love.graphics.newFont(24))
            love.graphics.print("[Esc to menu]",200,970,0)
        end
    }
end

return Settings