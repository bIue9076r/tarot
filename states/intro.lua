INTRO = 2

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

end
