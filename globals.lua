require("modules/assets")
require("modules/sfx")
require("modules/button")
require("modules/draggable")
require("modules/lgraphics")

LOAD = {}
UPDATE = {}
KEYPRESSED = {}
MOUSEPRESSED = {}
DRAW = {}

require("states/title")
require("states/intro")
require("states/readings")
require("states/arena")
require("states/shop")
require("states/end")

KEYPRESSED[-2] = function(key)
	if key == "return" then
		love.event.quit()
	end
end

DRAW[-2] = function()
	love.graphics.setBackgroundColor(0,0,1)
	love.graphics.setColor(1,1,1)
	LPrint(PANIC_REASON,50,50)
end

GAME_STATE = 1

function Panic(caller)
	GAME_STATE = -2
	if caller then
		PANIC_REASON = "Panic called by "..caller
	else
		PANIC_REASON = "Panic"
	end
end
