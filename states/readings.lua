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

require("reading_stuff.dayOne")
require("reading_stuff.dayTwo")
require("reading_stuff.dayThree")
require("reading_stuff.dayFour")
require("reading_stuff.dayFive")

READINGS_DAY = DAY_ONE

LOAD[READINGS] = function()
	print("hi")
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

UPDATE[READINGS] = function(dt)
	local f = READINGS_UPDATE[READINGS_DAY]
	if f then f(dt) end
end

KEYPRESSED[READINGS] = function(key)
	local f = READINGS_KEYPRESSED[READINGS_DAY]
	if f then f(key) end
end

MOUSEPRESSED[READINGS] = function(x,y,button)
	local f = READINGS_MOUSEPRESSED[READINGS_DAY]
	if f then f(x,y,button) end
end

DRAW[READINGS] = function()
	love.graphics.setBackgroundColor(1,0,1)
	love.graphics.setColor(1,1,1)
	local f = READINGS_DRAW[READINGS_DAY]
	if f then f() end
end