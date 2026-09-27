math.randomseed(os.time())
jit.off()
love.graphics.setDefaultFilter("nearest", "nearest")
require("globals")

function love.load()
	GetText()
	-- Switch_State(ARENA)
	local f = LOAD[GAME_STATE]
	if f then
		f()
	end
end

function love.update(dt)
	local f = UPDATE[GAME_STATE]
	if f then
		f(dt)
	end
end

function love.keypressed(key)
	local f = KEYPRESSED[GAME_STATE]
	if f then
		f(key)
	end
end

function love.mousepressed(x,y,button)
	local f = MOUSEPRESSED[GAME_STATE]
	if f then
		f(x,y,button)
	end
end

function love.draw()
	Draw_Sfx()
	local f = DRAW[GAME_STATE]
	if f then
		f()
	end
end
