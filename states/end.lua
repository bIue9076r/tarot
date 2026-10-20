ENDING = 6

Finale = 0 -- Ending
Finale_t = 0

LOAD[ENDING] = function()
	Finale = CheckKarma() -- Ending based of Karma
	Finale_t = 0
	Finale = 4
end

UPDATE[ENDING] = function(dt)

end

KEYPRESSED[ENDING] = function(key)
    if key == "return" or key == "space" then
		GoToArena() -- Endless Boss
		local song = Sound.get("murder")
		if song then
			song:stop()
		end
    end
end

MOUSEPRESSED[ENDING] = function(x,y,button)

end

DRAW[ENDING] = function()
	Finale_t = Finale_t + DT()
	-- Bad Ending
	if Finale == 4 then
		local song = Sound.get("murder")
		local img = Image.get("jumpscare")
		love.graphics.draw(img,0,0,DT()*3)
		if song then
			song:setVolume(Logarithming(GAME_SFX_VOLUME))
			if not song:isPlaying() and Finale_t <= 2 then
				song:play()
			end
		end

		if Finale_t >= 3 then
			local t = math.min(Finale_t - 3,1)
			love.graphics.setColor(0.7,0,0,t)
			love.graphics.rectangle("fill",0,0,800,600)
			love.graphics.setColor(1,1,1)
		end
	-- Good Ending
	elseif Finale == 2 then
		-- slideshow from animation variable
		local n = math.min(4,math.floor(Finale_t/2.5)) + 1
		if n <= 4 then
			local img = Image.get("final_"..n)
			love.graphics.draw(img)
		end

		if Finale_t > 11 then
			local t = math.max(0,math.min(Finale_t - 11,1))
			love.graphics.setColor(1,1,1,t)
			love.graphics.printf({{1,1,1},Text(312)},130,100,540,"center")
			t = math.max(0,math.min(Finale_t - 16,1))
			love.graphics.setColor(1,1,1,t)
			love.graphics.printf({{1,1,1},Text(313)},130,120,540,"center")
			t = math.max(0,math.min(Finale_t - 20,1))
			love.graphics.setColor(1,1,1,t)
			love.graphics.printf({{1,1,1},Text(314)},130,160,540,"center")
			t = math.max(0,math.min(Finale_t - 24,1))
			love.graphics.setColor(1,1,1,t)
			love.graphics.printf({{1,1,1},Text(315)},130,180,540,"center")
			t = math.max(0,math.min(Finale_t - 28,1))
			love.graphics.setColor(1,1,1,t)
			love.graphics.printf({{1,1,1},Text(316)},130,420,540,"center")
		end
	-- Neutral Ending
	elseif Finale == 1 or Finale == 3 then
		love.graphics.setColor(1,1,1)
		local bg = Image.get("tent")
		love.graphics.draw(bg)
		local img = Image.get("table_n_ball")
		love.graphics.draw(img)

		if Finale_t < 3 then
			if Finale_t >= 2 then
				TAROTCARDS[1]:draw(1,1 - (Finale_t - 2))
				TAROTCARDS[1]:draw(2,1 - (Finale_t - 2))
				TAROTCARDS[1]:draw(3,1 - (Finale_t - 2))
				TAROTCARDS[1]:draw(4,1 - (Finale_t - 2))
			else
				TAROTCARDS[1]:draw(1,1)
				TAROTCARDS[1]:draw(2,1)
				TAROTCARDS[1]:draw(3,1)
				TAROTCARDS[1]:draw(4,1)
			end
		else
			img = Image.get("dialogue_1")
			love.graphics.setColor(0.97,0.7,0.97)
			love.graphics.draw(img,0,-15,0,1,0.5)
			love.graphics.setColor(1,1,1)
			love.graphics.printf({{0,0,0},Text(311)},130,100,370,"left")
		end
	end
end
