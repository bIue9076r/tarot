ENDING = 6

Finale = 0
Finale_t = 0

LOAD[ENDING] = function()
	Finale = CheckKarma()
	Finale_T = 0
end

UPDATE[ENDING] = function(dt)

end

KEYPRESSED[ENDING] = function(key)
    if key == "return" then
		GoToArena() -- Endless Boss
    end
end

MOUSEPRESSED[ENDING] = function(x,y,button)

end

DRAW[ENDING] = function()
	Finale_t = Finale_t + DT()
	if Finale == 4 then
		local song = Sound.get("murder")
		local img = Image.get("jumpscare")
		love.graphics.draw(img,0,0,DT()*3)
		if song then
			song:setVolume(Logarithming(GAME_SFX_VOLUME))
			if not song:isPlaying() then
				song:play()
			end
		end
	elseif Finale == 3 then
		local n = math.min(4,math.floor(Finale_t/2.5)) + 1
		if n <= 4 then
			local img = Image.get("final_"..n)
			love.graphics.draw(img)
		end
	elseif Finale == 2 or Finale == 1 then
		love.graphics.setColor(1,1,1)
		local bg = Image.get("tent")
		love.graphics.draw(bg)
		local img = Image.get("table_n_ball")
		love.graphics.draw(img)
		TAROTCARDS[1]:draw(1,1)
		TAROTCARDS[1]:draw(2,1)
		TAROTCARDS[1]:draw(3,1)
		TAROTCARDS[1]:draw(4,1)
	end
end
