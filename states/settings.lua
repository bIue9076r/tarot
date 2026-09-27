SETTINGS = 8

-- Buttons
Exit_But = Button.new(650,500,130,70)

Volume_Up = Button.new(140,150,75,75)
Volume_Down = Button.new(255,150,75,75)

Music_Volume_Up = Button.new(140,250,75,75)
Music_Volume_Down = Button.new(255,250,75,75)

Sfx_Volume_Up = Button.new(140,350,75,75)
Sfx_Volume_Down = Button.new(255,350,75,75)

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
	if key == "return" then
		Switch_State(TITLE)
	end
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
	local song = Sound.get("thePsychic")
	if song then
		song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not song:isPlaying() then
			song:play()
		end
	end

	love.graphics.setColor(1,1,1)
	local img
	img = Image.get("tent")
	love.graphics.draw(img)

	img = Image.get("table")
	love.graphics.draw(img)

	img = Image.get("settingsbox")
	love.graphics.draw(img)

	if Volume_Up.f then
		Volume_Up.t = Volume_Up.t + DT()
		local t = math.min(Volume_Up.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("plus")
	love.graphics.draw(img)
	if Volume_Down.f then
		Volume_Down.t = Volume_Down.t + DT()
		local t = math.min(Volume_Down.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("minus")
	love.graphics.draw(img)

	if Music_Volume_Up.f then
		Music_Volume_Up.t = Music_Volume_Up.t + DT()
		local t = math.min(Music_Volume_Up.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("plus")
	love.graphics.draw(img,0,100)
	if Music_Volume_Down.f then
		Music_Volume_Down.t = Music_Volume_Down.t + DT()
		local t = math.min(Music_Volume_Down.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("minus")
	love.graphics.draw(img,0,100)

	if Sfx_Volume_Up.f then
		Sfx_Volume_Up.t = Sfx_Volume_Up.t + DT()
		local t = math.min(Sfx_Volume_Up.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("plus")
	love.graphics.draw(img,0,200)
	if Sfx_Volume_Down.f then
		Sfx_Volume_Down.t = Sfx_Volume_Down.t + DT()
		local t = math.min(Sfx_Volume_Down.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("minus")
	love.graphics.draw(img,0,200)

	love.graphics.print({{0,0,0},"Main Volume "..string.format("%d%%",GAME_MAIN_VOLUME * 100)},375,180)
	love.graphics.print({{0,0,0},"Music Volume "..string.format("%d%%",GAME_MUSIC_VOLUME * 100)},375,280)
	love.graphics.print({{0,0,0},"SFX Volume "..string.format("%d%%",GAME_SFX_VOLUME * 100)},375,380)

	if Exit_But.f then
		Exit_But.t = Exit_But.t + DT()
		local t = math.min(Exit_But.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("exit")
	love.graphics.draw(img)
end
