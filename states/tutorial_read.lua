TUTORIAL_READ = 9

LOAD[TUTORIAL_READ] = function()

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

end
