local love = require"love"
local Menu = require"state/Menu"
local Game = require"state/Game"
local Settings = require"state/Settings"
local End = require"state/Ended"
local Info = require"state/Info"
local Sfx = require"components/sfx"

function love.load()
    sfx = Sfx()
    --sfx:playBGM()
    math.randomseed(os.time())
    menu = Menu()

    game = Game()
    game:insertTiles()
    game.doodle_p.x = game.tiles[6].x[1] + 50
    _G.gravity = 300
    _G.jump_timer =0
    _G.jump = false

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
                for k, value in ipairs(settings.doodle) do
                    if settings.doodle[k].select == true then
                        if k==8 then
                            break
                        end
                        settings.doodle[k].select=false
                        settings.doodle[k+1].select=true
                        break
                    end
                end
            elseif key=="left" then
                for k, value in ipairs(settings.doodle) do
                    if settings.doodle[k].select == true then
                        if k==1 then
                            break
                        end
                        settings.doodle[k].select=false
                        settings.doodle[k-1].select=true
                        break
                    end
                end
            end
        end
    elseif state=="info" then
        if key=="escape" then
            ChangeGameState("menu")
        end
    elseif state=="game" then
        if key=="escape" then
            if game.paused then
                game.paused = false
                game.opacity = 1
            else
                game.paused = true
                game.opacity = 0.4
            end
        end
        if game.paused==false then
            if game:checkCollision() then
                if key=="space" then
                    jump_timer = game.doodle_p.y/(game.doodle_p.y - game.jump_dist)--for position tweening
                end
            end
        end
    elseif state=="ended" then
        if key=="escape" then
            ChangeGameState("menu")
        end
    end
end
-----------------------------------------------------------------------------------
function love.update(dt)

    for _, value in ipairs(settings.doodle) do
        if value.select == true then
            game.doodle_p.image = value.image
        end
    end
    
    if state=="game" then
        if game.paused==false then
            
            if game:checkCollision() then--translate 
                if game.doodle_p.y < 690 and game.doodle_p.y > 540 then
                    if jump then
                        --change all x position of all tiles to current one
                        jump = false
                    end
                    --push down all tiles by 150
                    --remove last tile from below 
                    --insert new tile to top
                elseif game.doodle_p.y < 90 then--it means we came here through jump power-up.
                    --push down all tiles by 900
                    --remove last 6 tiles from below 
                    --insert new 6 tiles to top
                end
            else
                game.doodle_p.y = game.doodle_p.y + dt * gravity
            end
            if jump_timer > 1 then--position tweening
                game.doodle_p.y = final_position * jump_timer
                jump_timer = jump_timer - dt*2
            else
                jump_timer = 0
            end

            if love.keyboard.isDown("a") then
                game.doodle_p.x = game.doodle_p.x - dt * 200
            elseif love.keyboard.isDown("d") then
                game.doodle_p.x = game.doodle_p.x + dt * 200
            end
            if game.doodle_p.x > love.graphics.getWidth() then
                game.doodle_p.x = 0
            elseif game.doodle_p.x + 60 < 0 then
                game.doodle_p.x = love.graphics.getWidth()
            end
            if game.doodle_p.y > love.graphics.getHeight() then
                ChangeGameState("ended")
                game.doodle_p.y = 570
            end
        end
        love.mouse.setVisible(false)
    elseif state=="ended" then
        love.mouse.setVisible(true)
    elseif state=="settings" then
        settings.volumeSlider:update()
        sfx:setBGvol(settings.volumeSlider:getValue())
    end
end
-----------------------------------------------------------------------------------
function love.draw()
    if state == "menu" then
        menu:draw()
    elseif state == "settings" then
        settings:draw()
    elseif state == "game" then
        game:draw()
    elseif state == "ended" then
        ended:draw()
    elseif state == "info" then
        info:draw()
    end
end