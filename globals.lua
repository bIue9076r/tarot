-- These are protable modules that do not depend on this game
require("modules/assets") -- asset manager
require("modules/sfx") -- Sound effect queue
require("modules/button") -- Button
require("modules/draggable") -- Draggable items/buttons
require("modules/lgraphics") -- Shorthands for love.graphics functions

-- Loads game assets
require("assets/load")

-- Game state tables
LOAD = {}
UPDATE = {}
KEYPRESSED = {}
MOUSEPRESSED = {}
DRAW = {}

TEXT = {}

-- Game states
-- defines functions in the tables above for every state
require("states/title")
require("states/intro")
require("states/readings")
require("states/arena")
require("states/shop") -- unused
require("states/end")
require("states/settings")

-- Error State keypressed
KEYPRESSED[-2] = function(key)
	if key == "return" then
		-- this exits the game
		love.event.quit()
	end
end

-- Error State draw
DRAW[-2] = function()
	love.graphics.setBackgroundColor(0,0,1)
	love.graphics.setColor(1,1,1)
	LPrint(PANIC_REASON,50,50)
end

-- Calls the next state's load function before updating state
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
-- 7 - settings
-- 8 - 

GAME_MAIN_VOLUME = 1
GAME_MUSIC_VOLUME = 1
GAME_SFX_VOLUME = 1

-- This function converts the volume in range 0-1 to be logarithmic instead of linear
-- (ears hear logarithmicly so it sounds more intuitive to listen to)
function Logarithming(vol)
	return math.log(((math.exp(1) - 1) * vol) + 1)
end

-- Quickly retrives delta time
function DT()
	return love.timer.getDelta()
end

-- Blue screen, error
function Panic(caller)
	GAME_STATE = -2
	if caller then
		PANIC_REASON = "Panic called by "..caller
	else
		PANIC_REASON = "Panic"
	end
end

-- Gets Global Text file
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

-- Gets a string at an index
function Text(n)
	return TEXT[n] or ""
end