ENDING = 6

Finale = 0
Finale_t = 0

LOAD[ENDING] = function()
	Finale = CheckKarma()
	Finale_T = 0
	Finale = 4
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
		local len = 10
		local n = math.min(len,math.floor(Finale_t))
	elseif Finale == 2 then
		local len = 10
		local n = math.min(len,math.floor(Finale_t))
	elseif Finale == 1 then
		local len = 10
		local n = math.min(len,math.floor(Finale_t))
	end
end
