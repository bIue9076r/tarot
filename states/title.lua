TITLE = 1

-- Buttons
-- X position, Y position, Witdh, Height
New_Game_But = Button.new(630,50,145,75)
Setting_But = Button.new(40,40,160,80)

LOAD[TITLE] = function()

end

UPDATE[TITLE] = function(dt)
	local x,y = love.mouse.getPosition()

	-- Check if either button is in focus based on mouse position
	New_Game_But:focus(x,y)
	Setting_But:focus(x,y)
end

KEYPRESSED[TITLE] = function(key)

end

MOUSEPRESSED[TITLE] = function(x,y,button)
	-- Start a new game if play button clicked
	if New_Game_But:click(x,y,button) then
		Switch_State(INTRO)
	end

	-- Open settings if settings clicked
	if Setting_But:click(x,y,button) then
		Switch_State(SETTINGS)
	end
end

DRAW[TITLE] = function()
	-- Play background title song
	local song = Sound.get("thePsychic")
	if song then
		song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not song:isPlaying() then
			song:play()
		end
	end
	love.graphics.setColor(1,1,1)
	local img
	img = Image.get("intro_back")
	love.graphics.draw(img)

	-- Alternative to Button:draw
	-- it changes the color of the button when it is focused
	-- New_Game_But.f is a boolean that means the button is focused
	-- New_Game_But.t is an animation variable
	if New_Game_But.f then
		New_Game_But.t = New_Game_But.t + 2*DT()
		local t = math.min(New_Game_But.t,1)
		love.graphics.setColor(0.6*t + (1 - t),0.6*t + (1 - t),0.6*t + (1 - t))
	else
		New_Game_But.t = 0
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("intro_play")
	love.graphics.draw(img)

	if Setting_But.f then
		Setting_But.t = Setting_But.t + 2*DT()
		local t = math.min(Setting_But.t,1)
		love.graphics.setColor(0.6*t + (1 - t),0.6*t + (1 - t),0.6*t + (1 - t))
	else
		Setting_But.t = 0
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("intro_settings")
	love.graphics.draw(img)
end
