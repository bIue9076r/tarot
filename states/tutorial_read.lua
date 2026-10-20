TUTORIAL_READ = 9

Tutorial_Section = 1
Tutorial_Ballface = "smug"
Tutorial_Text = ""
Tutorial_Show = false

LOAD[TUTORIAL_READ] = function()
	Tutorial_Section = 1
	Tutorial_Ballface = "smug"
	Tutorial_Text = Text(295 + Tutorial_Section - 1)
	Tutorial_Show = false
end

UPDATE[TUTORIAL_READ] = function(dt)
	Tutorial_Show = false
	if Tutorial_Section == 1 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 2 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 3 then
		Tutorial_Ballface = "no"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 4 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 5 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 6 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 7 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 8 then
		Tutorial_Ballface = "upside"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 9 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
	elseif Tutorial_Section == 10 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 11 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 12 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 13 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 14 then
		Tutorial_Ballface = "shock"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 15 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 16 then
		Tutorial_Ballface = "smug"
		Tutorial_Text = Text(295 + Tutorial_Section - 1)
		Tutorial_Show = true
	elseif Tutorial_Section == 17 then
		GAME_STATE = State_Return
		local song = Sound.get("shop")
		if song then
			song:stop()
		end
	end
end

KEYPRESSED[TUTORIAL_READ] = function(key)
	if key == "escape" then
		GAME_STATE = State_Return
		local song = Sound.get("shop")
		if song then
			song:stop()
		end
	end

	if key == "backspace" then
		Tutorial_Section = math.max(1,Tutorial_Section - 1)
	end

	if key == "return" or key == "space" then
		Tutorial_Section = math.min(17,Tutorial_Section + 1)
	end
end

MOUSEPRESSED[TUTORIAL_READ] = function(x,y,button)
	Tutorial_Section = math.min(17,Tutorial_Section + 1)
end

DRAW[TUTORIAL_READ] = function()
	-- play the shop song
	local song = Sound.get("shop")
	if song then
		song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not song:isPlaying() then
			song:play()
		end
	end

	-- Draw the background tent
	love.graphics.setColor(1,1,1)
	local bg = Image.get("tent")
	love.graphics.draw(bg)

	local TABL = Image.get("table")
    love.graphics.draw(TABL)

	local ball = Image.get("ball")
	local ballface = Image.get("ball"..Tutorial_Ballface)
	love.graphics.draw(ball)
	love.graphics.draw(ballface,350,390)

	local img = Image.get("dialogue_3")
	love.graphics.setColor(0.97,0.97,0.7)
	love.graphics.draw(img,0,-15,0,1,0.5)
	love.graphics.printf({{0,0,0},Tutorial_Text},130,100,370,"left")
	love.graphics.setColor(1,1,1)

	if Tutorial_Show then
		TAROTCARDS[10]:draw(1,1)
		TAROTCARDS[10]:hint(1,1)
	end

	love.graphics.setColor(1,1,1)
end
