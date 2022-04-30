-- You'll want to import these in just about every project you'll work on.
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Declaring this "gfx" shorthand will make your life easier. Instead of having
-- to preface all graphics calls with "playdate.graphics", just use "gfx."
-- Performance will be slightly enhanced, too.
-- NOTE: Because it's local, you'll have to do it in every .lua source file.
local gfx <const> = playdate.graphics

-- set the background black
gfx.setColor(gfx.kColorBlack)

-- `playdate.update()` is the heart of every Playdate game.
-- This function is called right before every frame is drawn onscreen.
-- Use this function to poll input, run game logic, and move sprites.
function playdate.update()
    gfx.fillRect(0, 0, 400, 240)
    playdate.drawFPS(0,0)

    -- Call the functions below in playdate.update() to draw sprites and keep
    gfx.sprite.update()
    -- timers updated. (We aren't using timers in this example, but in most
    -- average-complexity games, you will.)
    playdate.timer.updateTimers()
end
