local love = require"love"
local Menu = require"state/Menu"
local Game = require"state/Game"
local Settings = require"state/Settings"
local End = require"state/Ended"
local Info = require"state/Info"
local Sfx = require"components/sfx"

function love.load()
    sfx = Sfx()
    sfx:playBGM()
    math.randomseed(os.time())
    menu = Menu()
    game = Game()
    ended = End()
    info = Info()
    settings = Settings()
    menuBox = 1
    settingBox = 1
    _G.state = "menu"
end
function ChangeGameState(str)
    if str == "menu" then
        state = "menu"
    elseif str == "game" then
        state = "game"
    elseif str == "ended" then
        state = "ended"
    elseif str == "info" then
        state = "info"
    elseif str == "settings" then
        state = "settings"
    end
end
function love.keypressed(key)
    if state=="menu" then
        if key=="up" then
            menuBox = menuBox - 1
        elseif key=="down" then
            menuBox = menuBox + 1
        end
        if menuBox < 1 then
            menuBox = 1
        end
        if menuBox > 4 then
            menuBox = 4
        end
        if key == "return" then
            if menuBox==1 then
                ChangeGameState("game")
            elseif menuBox==2 then
                ChangeGameState("settings")
            elseif menuBox==3 then
                ChangeGameState("info")
            elseif menuBox==4 then
                love.event.quit()
            end
        end
    elseif state=="settings" then
        if key=="escape" then
            ChangeGameState("menu")
            settingBox = 1
        elseif key=="up" then
            settings.difficulty.select = true
            settings.doodleSelect = false
        elseif key=="down" then
            settings.difficulty.select = false
            settings.doodleSelect = true
        end
        if settings.difficulty.select==true then
            if key=="right" then
                settings.difficulty.hard = true
                settings.difficulty.normal=false
            elseif key=="left" then
                settings.difficulty.hard = false
                settings.difficulty.normal=true
            end
        elseif settings.doodleSelect==true then
            if key=="right" then
                for key, value in ipairs(settings.doodle) do
                    if settings.doodle[key].select == true then
                        if key==8 then
                            break
                        end
                        settings.doodle[key].select=false
                        settings.doodle[key+1].select=true
                        break
                    end
                end
            elseif key=="left" then
                for key, value in ipairs(settings.doodle) do
                    if settings.doodle[key].select == true then
                        if key==1 then
                            break
                        end
                        settings.doodle[key].select=false
                        settings.doodle[key-1].select=true
                        break
                    end
                end
            end
        end
    elseif state=="info" then
        if key=="escape" then
            ChangeGameState("menu")
        end
    end
    
end
-----------------------------------------------------------------------------------
function love.update(dt)
    

    if state=="game" then
        love.mouse.setVisible(false)
    elseif state=="settings" then
        settings.volumeSlider:update()
        sfx:setBGvol(settings.volumeSlider:getValue())
    end
end
-----------------------------------------------------------------------------------
function love.draw()
    if state == "menu" then
        menu:draw()
    elseif state == "game" then
        game:draw()
    elseif state == "settings" then
        settings:draw()
    elseif state == "ended" then
        ended:draw()
    elseif state == "info" then
        info:draw()
    end
end