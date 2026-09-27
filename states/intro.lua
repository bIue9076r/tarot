INTRO = 2

Intro_t = 0

LOAD[INTRO] = function()

end

UPDATE[INTRO] = function(dt)

end

KEYPRESSED[INTRO] = function(key)
    if key == "return" then
        Switch_State(READINGS)
    end

end

MOUSEPRESSED[INTRO] = function(x,y,button)

end

DRAW[INTRO] = function()
	local len = 10
	local n = math.min(len,math.floor(Finale_t))
end
