require("reading_stuff.interactions")
DAY_ONE = 1

Reading_Interactions_Index = 1
Reading_Interactions = {
	[1] = Interaction_Hierophant
}
Reading_Customers = {}
Reading_Customers_Cards = {}
Reading_Player_Choice = "Bad"
Reading_Card_t = 0

Readings_Intro = 1
Readings_Crystal = 2
Readings_Card = 3
Readings_Results = 4

Readings_state = Readings_Intro

Readings_Subupdate = {
	[Readings_Intro] = function(dt)
		
	end,

	[Readings_Crystal] = function(dt)
		
	end,

	[Readings_Card] = function(dt)
		
	end,

	[Readings_Results] = function(dt)
		
	end,
}

Readings_Subkeypressed = {
	[Readings_Intro] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if key == "space" then
			dialogue:next()
		end

		if key == "return" and dialogue:over() then
			Readings_state = Readings_Crystal
		end
	end,

	[Readings_Crystal] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		if key == "space" then
			dialogue:next()
		end

		if key == "return" and dialogue:over() then
			Readings_state = Readings_Card
		end
	end,

	[Readings_Card] = function(key)
		
	end,

	[Readings_Results] = function(key)
		
	end,
}

Readings_Submousepressed = {
	[Readings_Intro] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if dialogue:over() then
			if ((x - 400)*(x - 400) + (y - 440)*(y - 440) < 50*50) then
				Readings_state = Readings_Crystal
			end
		end
	end,

	[Readings_Crystal] = function(x,y,button)
		
	end,

	[Readings_Card] = function(x,y,button)
		
	end,

	[Readings_Results] = function(x,y,button)
		
	end,
}

Readings_Subdraw = {
	[Readings_Intro] = function()
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		local text = dialogue:get()
		local customer = Reading_Customers[Reading_Interactions_Index]
		if text.speaker == SPEAKER_CHARACTER then
			customer.yap = true
		else
			customer.yap = false
		end

		customer:draw()
		local img = Image.get("dialogue_"..text.speaker)
		if text.speaker == SPEAKER_PLAYER then
			love.graphics.setColor(0.7,0,0.7)
		elseif text.speaker == SPEAKER_BALL then
			love.graphics.setColor(0.7,0.7,0)
		else
			love.graphics.setColor(1,1,1)
		end
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},Text(text.text)},130,100,370,"left")
		love.graphics.setColor(1,1,1)
		if text.speaker == SPEAKER_BALL then
			img = Image.get("ballsmug")
			love.graphics.draw(img,350,390)
		end
	end,

	[Readings_Crystal] = function()
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		local text = dialogue:get()
		local customer = Reading_Customers[Reading_Interactions_Index]
		if text.speaker == SPEAKER_CHARACTER then
			customer.yap = true
		else
			customer.yap = false
		end

		customer:draw()
		local img = Image.get("dialogue_"..text.speaker)
		if text.speaker == SPEAKER_PLAYER then
			love.graphics.setColor(0.7,0,0.7)
		elseif text.speaker == SPEAKER_BALL then
			love.graphics.setColor(0.7,0.7,0)
		else
			love.graphics.setColor(1,1,1)
		end
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},Text(text.text)},130,100,370,"left")
		love.graphics.setColor(1,1,1)
		if text.speaker == SPEAKER_BALL then
			img = Image.get("ballsmug")
			love.graphics.draw(img,350,390)
		end
	end,

	[Readings_Card] = function()
		local customer = Reading_Customers[Reading_Interactions_Index]
		local cards = Reading_Customers_Cards[Reading_Interactions_Index]
		customer.yap = false
		customer:draw()
		for i = 1,4 do
			Reading_Card_t = Reading_Card_t + DT()
			local t = math.min(Reading_Card_t,1)
			TAROTCARDS[cards[i]]:draw(i,t)
		end
	end,

	[Readings_Results] = function()
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Choices[Reading_Player_Choice]
		local text = dialogue:get()
		local customer = Reading_Customers[Reading_Interactions_Index]
		if text.speaker == SPEAKER_CHARACTER then
			customer.yap = true
		else
			customer.yap = false
		end

		customer:draw()
		local img = Image.get("dialogue_"..text.speaker)
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},Text(text.text)},130,100,370,"left")
	end,
}

READINGS_LOAD[DAY_ONE] = function()
	Reading_Customers = {
		Characters[5],
		Characters[RandomCustomer()],
		Characters[RandomCustomer()],
	}
    
	Reading_Customers_Cards = {}
	Reading_Customers_Cards[1] = RandomCards(READINGS_DAY)
	Reading_Customers_Cards[2] = RandomCards(READINGS_DAY)
	Reading_Customers_Cards[3] = RandomCards(READINGS_DAY)
	Reading_Customers_Cards[4] = RandomCards(READINGS_DAY)
end

READINGS_UPDATE[DAY_ONE] = function(dt)
	local f = Readings_Subupdate[Readings_state]
	if f then f(dt) end
end

READINGS_KEYPRESSED[DAY_ONE] = function(key)
	local f = Readings_Subkeypressed[Readings_state]
	if f then f(key) end
end

READINGS_MOUSEPRESSED[DAY_ONE] = function(x,y,button)
	local f = Readings_Submousepressed[Readings_state]
	if f then f(x,y,button) end
end

READINGS_DRAW[DAY_ONE] = function()
	local f = Readings_Subdraw[Readings_state]
	if f then f() end
end
