ENDING = 6

Finale = 0
Finale_T = 0

LOAD[ENDING] = function()
	Finale = CheckKarma()
	Finale_T = 0
	Finale = 4
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
	Finale_T = Finale_T + DT()
	if Finale == 4 then
		local img = Image.get("jumpscare")
		love.graphics.draw(img,0,0,DT()*3)
	elseif Finale == 3 then
		local len = 10
		local n = math.min(len,math.floor(Finale_T))
	elseif Finale == 2 then
		local len = 10
		local n = math.min(len,math.floor(Finale_T))
	elseif Finale == 1 then
		local len = 10
		local n = math.min(len,math.floor(Finale_T))
	end
end
