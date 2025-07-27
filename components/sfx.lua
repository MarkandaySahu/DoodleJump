local love = require"love"
function SFX()
    local bgm = love.audio.newSource("assets/Audio/bg.mp3","stream")
    bgm:setVolume(0.3)
    bgm:setLooping(true)
    local effects ={
            point = love.audio.newSource("assets/audio/collectible.wav","static"),
    }
    effects["point"]:setVolume(0.3)
    return{
        playBGM = function (self)
            if not bgm:isPlaying() then
                bgm:play()
            end
        end,
        setvol = function (self,v)
            bgm:setVolume(v)
            effects["point"]:setVolume(v)
        end,
        
        playFX = function (self,effect)
            effects[effect]:play()
        end
    }
end
return SFX