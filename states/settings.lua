SETTINGS = 8

-- Buttons
Exit_But = Button.new(580,450,150,100)

Volume_Up = Button.new(50,100,50,50)
Volume_Down = Button.new(125,100,50,50)

Music_Volume_Up = Button.new(50,200,50,50)
Music_Volume_Down = Button.new(125,200,50,50)

Sfx_Volume_Up = Button.new(50,300,50,50)
Sfx_Volume_Down = Button.new(125,300,50,50)

LOAD[SETTINGS] = function()

end

UPDATE[SETTINGS] = function(dt)
	local x,y = love.mouse.getPosition()

	Exit_But:focus(x,y)
	Volume_Up:focus(x,y)
	Volume_Down:focus(x,y)
	Music_Volume_Up:focus(x,y)
	Music_Volume_Down:focus(x,y)
	Sfx_Volume_Up:focus(x,y)
	Sfx_Volume_Down:focus(x,y)
end

KEYPRESSED[SETTINGS] = function(key)

end

MOUSEPRESSED[SETTINGS] = function(x,y,button)
    if Exit_But:click(x,y,button) then
        Switch_State(TITLE)
    end

	if Volume_Up:click(x,y,button) then
		GAME_MAIN_VOLUME = math.min(GAME_MAIN_VOLUME + 0.1, 1)
		love.audio.setVolume(Logarithming(GAME_MAIN_VOLUME))
	end
	if Volume_Down:click(x,y,button) then
		GAME_MAIN_VOLUME = math.max(GAME_MAIN_VOLUME - 0.1, 0)
		love.audio.setVolume(Logarithming(GAME_MAIN_VOLUME))
	end
	if Music_Volume_Up:click(x,y,button) then
		GAME_MUSIC_VOLUME = math.min(GAME_MUSIC_VOLUME + 0.1, 1)
	end
	if Music_Volume_Down:click(x,y,button) then
		GAME_MUSIC_VOLUME = math.max(GAME_MUSIC_VOLUME - 0.1, 0)
	end
	if Sfx_Volume_Up:click(x,y,button) then
		GAME_SFX_VOLUME = math.min(GAME_SFX_VOLUME + 0.1, 1)
	end
	if Sfx_Volume_Down:click(x,y,button) then
		GAME_SFX_VOLUME = math.max(GAME_SFX_VOLUME - 0.1, 0)
	end
end

DRAW[SETTINGS] = function()
    Exit_But:draw()
	Volume_Up:draw()
	Volume_Down:draw()
	Music_Volume_Up:draw()
	Music_Volume_Down:draw()
	Sfx_Volume_Up:draw()
	Sfx_Volume_Down:draw()

    love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(1,1,1)
	local x,y = love.mouse.getPosition()
	love.graphics.print("Main Volume "..string.format("%d%%",GAME_MAIN_VOLUME * 100),200,120)
	love.graphics.print("Main Volume "..string.format("%d%%",GAME_MUSIC_VOLUME * 100),200,220)
	love.graphics.print("Main Volume "..string.format("%d%%",GAME_SFX_VOLUME * 100),200,320)
end
