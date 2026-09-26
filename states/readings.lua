READINGS = 3

READINGS_LOAD = {}
READINGS_UPDATE = {}
READINGS_KEYPRESSED = {}
READINGS_MOUSEPRESSED = {}
READINGS_DRAW = {}
READINGS_DAY = 1

-- require("day_1")
DAY_ONE = 1
READINGS_LOAD[DAY_ONE] = function()
	
end

READINGS_UPDATE[DAY_ONE] = function(dt)
	
end

READINGS_KEYPRESSED[DAY_ONE] = function(key)
	
end

READINGS_MOUSEPRESSED[DAY_ONE] = function(x,y,button)
	
end

READINGS_DRAW[DAY_ONE] = function()
	
end


LOAD[READINGS] = function()
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

UPDATE[READINGS] = function(dt)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

KEYPRESSED[READINGS] = function(key)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

MOUSEPRESSED[READINGS] = function(x,y,button)
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

DRAW[READINGS] = function()
	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end