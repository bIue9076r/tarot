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

TEXT = {}

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

function Switch_State(State)
	local f = LOAD[State]
	if f then f() end
	GAME_STATE = State
end

GAME_STATE = TITLE
-- States:
-- 1 - title
-- 2 - intro
-- 3 - readings
-- 4 - arena
-- 5 - shop
-- 6 - ending

GAME_MAIN_VOLUME = 1
GAME_MUSIC_VOLUME = 1
GAME_SFX_VOLUME = 1

function DT()
	return love.timer.getDelta()
end

function Panic(caller)
	GAME_STATE = -2
	if caller then
		PANIC_REASON = "Panic called by "..caller
	else
		PANIC_REASON = "Panic"
	end
end

function GetText(path)
	path = path or "/assets/DD.txt"
	local info = love.filesystem.getInfo(path)
	if info then
		if info.type == "file" then
			for v in love.filesystem.lines(path) do
			table.insert(TEXT,v)
			end
		end
	end
end