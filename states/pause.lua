PAUSE = 8

function PauseState()
	State_Return = GAME_STATE
	GAME_STATE = PAUSE
end

State_Return = TITLE

Resume_But = Button.new(650,500,130,70)
Title_But = Button.new(70,90+75*0,150,50)
Tutorial1_But = Button.new(70,90+75*1,150,50)
Tutorial2_But = Button.new(70,90+75*2,150,50)
Key_But = Button.new(70,90+75*2,150,50)

LOAD[PAUSE] = function()

end

UPDATE[PAUSE] = function(dt)
	local x,y = love.mouse.getPosition()

	Resume_But:focus(x,y)
	Title_But:focus(x,y)
	Tutorial1_But:focus(x,y)
	Tutorial2_But:focus(x,y)
end

KEYPRESSED[PAUSE] = function(key)
	if key == "return" then
		local song = Sound.get("thePsychic")
		if song then
			song:stop()
		end
		GAME_STATE = State_Return
	end
end

MOUSEPRESSED[PAUSE] = function(x,y,button)
	if Resume_But:click(x,y,button) then
		local song = Sound.get("thePsychic")
		if song then
			song:stop()
		end
		GAME_STATE = State_Return
	end

	if Title_But:click(x,y,button) then
		local song = Sound.get("thePsychic")
		if song then
			song:stop()
		end
		Switch_State(TITLE)
	end

	if Tutorial1_But:click(x,y,button) then
		local song = Sound.get("thePsychic")
		if song then
			song:stop()
		end
		Switch_State(TUTORIAL_READ)
	end

	if Tutorial2_But:click(x,y,button) then
		local song = Sound.get("thePsychic")
		if song then
			song:stop()
		end
		Switch_State(TUTORIAL_ARENA)
	end
end

DRAW[PAUSE] = function()
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
	img = Image.get("tent")
	love.graphics.draw(img)

	img = Image.get("table")
	love.graphics.draw(img)

	img = Image.get("settingsbox")
	love.graphics.draw(img)

	if Resume_But.f then
		Resume_But.t = Resume_But.t + DT()
		local t = math.min(Resume_But.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,1,1)
	end
	img = Image.get("exit")
	love.graphics.draw(img)

	love.graphics.setColor(1,0,1)
	if Title_But.f then
		Title_But.t = Title_But.t + DT()
		local t = math.min(Title_But.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+0*(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,0,1)
	end
	love.graphics.rectangle("fill",70,90+75*0,150,50)
	love.graphics.print({{0,0,0},"Title Screen"},70+10,90+75*0+15)
	
	if Tutorial1_But.f then
		Tutorial1_But.t = Tutorial1_But.t + DT()
		local t = math.min(Tutorial1_But.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+0*(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,0,1)
	end
	love.graphics.rectangle("fill",70,90+75*1,150,50)
	love.graphics.print({{0,0,0},"Readings Tutorial"},70+10,90+75*1+15)

	if Tutorial2_But.f then
		Tutorial2_But.t = Tutorial2_But.t + DT()
		local t = math.min(Tutorial2_But.t,1)
		love.graphics.setColor(0.7*t+(1 - t),0.7*t+0*(1 - t),0.7*t+(1 - t))
	else
		love.graphics.setColor(1,0,1)
	end
	love.graphics.rectangle("fill",70,90+75*2,150,50)
	love.graphics.print({{0,0,0},"Arena Tutorial"},70+10,90+75*2+15)
	love.graphics.setColor(1,1,1)
end
