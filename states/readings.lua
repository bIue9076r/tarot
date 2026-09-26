require("reading_stuff.customer")
require("reading_stuff.random")
require("reading_stuff.tarot_cards")
require("reading_stuff.mc")
READINGS = 3

READINGS_LOAD = {}
READINGS_UPDATE = {}
READINGS_KEYPRESSED = {}
READINGS_MOUSEPRESSED = {}
READINGS_DRAW = {}
READINGS_DAY = DAY_ONE

require("/states/dayOne")
require("/states/dayTwo")
require("/states/dayThree")
require("/states/dayFour")
require("/states/dayFive")

LOAD[READINGS] = function()
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

UPDATE[READINGS] = function(dt)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f(dt) end
end

KEYPRESSED[READINGS] = function(key)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f(key) end
end

MOUSEPRESSED[READINGS] = function(x,y,button)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f(x,y,button) end
end

DRAW[READINGS] = function()
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end