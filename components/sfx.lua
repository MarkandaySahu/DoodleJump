local love = require"love"
function SFX()
    local bgm = love.audio.newSource("assets/Audio/bg.mp3","stream")
    bgm:setVolume(0.3)
    bgm:setLooping(true)
    return{
        playBGM = function (self)
            if not bgm:isPlaying() then
                bgm:play()
            end
        end,
        setBGvol = function (self,v)
            bgm:setVolume(v)
        end,
    }
end
return SFX