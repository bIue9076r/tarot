ENDING = 6

Finale = 0

LOAD[ENDING] = function()
	Finale = CheckKarma()
end

UPDATE[ENDING] = function(dt)

end

KEYPRESSED[ENDING] = function(key)
    if key == "return" then
		NextDay()
    end
end

MOUSEPRESSED[ENDING] = function(x,y,button)

end

DRAW[ENDING] = function()
	if Finale == 4 then
		local img = Image.get("jumpscare")
		love.graphics.draw(img,0,0,DT()*2)
	end
end
