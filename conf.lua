local love = require"love"
function love.conf(app)
    app.window.width = 610
    app.window.height = 1020
    app.window.title = "DoodleJump"
    app.window.icon = "assets/UI/singleplayer.png"
end