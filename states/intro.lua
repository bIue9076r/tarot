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
	Intro_t = Intro_t + DT()
	local len = 10
	local n = math.min(len,math.floor(Intro_t/4))
	local bg = Image.get("tent")
	love.graphics.draw(bg)
	local img = Image.get("table_n_ball")
	love.graphics.draw(img)

	if n == 0 then
		local img = Image.get("dialogue_1")
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},"Lets see the reading for the week"},130,100,370,"left")
	elseif n == 1 then
		local t = (Intro_t/4 - 1)
		TAROTCARDS[1]:draw(1,t)
		TAROTCARDS[1]:draw(2,t)
		TAROTCARDS[1]:draw(3,t)
		TAROTCARDS[1]:draw(4,t)
	elseif n == 2 then
		TAROTCARDS[1]:draw(1,1)
		TAROTCARDS[1]:draw(2,1)
		TAROTCARDS[1]:draw(3,1)
		TAROTCARDS[1]:draw(4,1)
		local img = Image.get("dialogue_1")
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},"Not Great!"},130,100,370,"left")
	elseif n == 3 then
		local img = Image.get("dialogue_1")
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},"I need to make the customers extra happy this week!"},130,100,370,"left")
	elseif n == 4 then
		local t = (Intro_t/4 - 4)
		love.graphics.setColor(0,0,0,(1 - t))
		love.graphics.rectangle("fill",0,0,800,600)
		love.graphics.setColor(1,1,1)
	else
		Switch_State(READINGS)
	end
end
