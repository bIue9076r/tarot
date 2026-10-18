TUTORIAL_ARENA = 10

LOAD[TUTORIAL_ARENA] = function()

end

UPDATE[TUTORIAL_ARENA] = function(dt)

end

KEYPRESSED[TUTORIAL_ARENA] = function(key)
	if key == "escape" then
		GAME_STATE = State_Return
	end
end

MOUSEPRESSED[TUTORIAL_ARENA] = function(x,y,button)

end

DRAW[TUTORIAL_ARENA] = function()

end
