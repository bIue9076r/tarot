math.randomseed(os.time()) -- Changes the randomseed to be a new value every time the game starts
if jit then
jit.off()	-- turns off Just in time optimizations
			-- JIT optimizations only work on windows and crash the game on other computers
			-- Plus they are prone to memory errors
end
love.graphics.setDefaultFilter("nearest", "nearest") -- tells graphics to use the image pixels as is, instead of scaling

-- Globals define everything else that is not a love function
require("globals")

-- love.load is called when the program loads
function love.load(args)
	-- Gets global text
	GetText()

	-- Argument parser
	for i,v in pairs(args) do
		if v == "-arena" or v == "-a" then
			Switch_State(ARENA)
			READINGS_DAY = 6
		end
	end

	-- if a state has a load function
	local f = LOAD[GAME_STATE]
	if f then
		-- run it here
		f()
	end
end

-- love.update is called every frame
-- it passes the time between frames as 'dt'
function love.update(dt)
	-- if a state has a update function
	local f = UPDATE[GAME_STATE]
	if f then
		-- run it here
		f(dt)
	end
end

-- love.keypressed is called everytime the player presses a key
-- it passes the key
function love.keypressed(key)
	-- if a state has a keypressed function
	local f = KEYPRESSED[GAME_STATE]
	if f then
		-- run it here
		f(key)
	end
end

-- love.mousepressed is called everytime the player presses the mouse
-- it passes the position (x,y) and the button
function love.mousepressed(x,y,button)
	-- if a state has a mousepressed function
	local f = MOUSEPRESSED[GAME_STATE]
	if f then
		-- run it here
		f(x,y,button)
	end
end

-- love.draw is called every frame to display to the screen
function love.draw()
	-- Play the SFX queue
	Draw_Sfx()
	-- if a state has a draw function
	local f = DRAW[GAME_STATE]
	if f then
		-- run it here
		f()
	end
end
