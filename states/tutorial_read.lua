TUTORIAL_READ = 9

Tutorial_Section = 1

LOAD[TUTORIAL_READ] = function()
	Tutorial_Section = 1
end

UPDATE[TUTORIAL_READ] = function(dt)

end

KEYPRESSED[TUTORIAL_READ] = function(key)
	if key == "escape" then
		GAME_STATE = State_Return
	end
end

MOUSEPRESSED[TUTORIAL_READ] = function(x,y,button)

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
	
end
