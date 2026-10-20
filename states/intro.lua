INTRO = 2

-- Intro animation variable
Intro_t = 0

LOAD[INTRO] = function()
	READINGS_DAY = 0
	Karma = 0
	Intro_t = 0
	ResetTexts()
end

UPDATE[INTRO] = function(dt)

end

KEYPRESSED[INTRO] = function(key)
    if key == "return" then
		-- skip cutscene
        Switch_State(READINGS)
    end

end

MOUSEPRESSED[INTRO] = function(x,y,button)

end

DRAW[INTRO] = function()
	Intro_t = Intro_t + DT()
	local len = 6
	local n = (math.floor(Intro_t) + 1) -- slide show
	-- n is forced to be an integer, and changes every second

	if n <= len then
		local img = Image.get("intro_"..n)
		love.graphics.draw(img)
	else
		Switch_State(READINGS)
	end
end
