require("reading_stuff.customer")
require("reading_stuff.random")
require("reading_stuff.tarot_cards")
require("reading_stuff.mc")
READINGS = 3

READINGS_LOAD = {}

require("reading_stuff.interactions")

Reading_Interactions_Index = 1
Reading_Interactions = {}
Reading_Customers = {}
Reading_Customers_Cards = {}
Reading_Player_Choice = "Bad"
Reading_Card_t = 0
Reading_Card_fade = 0
Reading_Card_dim = 0
Reading_Fade = 0
Reading_Dofade = false
Reading_Fadereverse = false
Reading_Fademax = 2

Readings_Intro = 1
Readings_Crystal = 2
Readings_Card = 3
Readings_Results = 4

Readings_state = Readings_Intro
Readings_Card_Button_1 = Button.new(30,400,150,175)
Readings_Card_Button_2 = Button.new(230,400,150,175)
Readings_Card_Button_3 = Button.new(430,400,150,175)
Readings_Card_Button_4 = Button.new(630,400,150,175)

READINGS_DAY = 0

function NextDay()
	READINGS_DAY = READINGS_DAY + 1
	if READINGS_DAY >= 2 then
		-- Ending
		if READINGS_DAY >= 3 then
			GoToArena() -- Endless boss fight
		end
		return
	end

	Reading_Player_Choice = "Bad"
	Reading_Card_t = 0
	Reading_Card_fade = 0
	Reading_Card_dim = 0
	Reading_Fade = 0
	Reading_Dofade = false
	Reading_Fadereverse = false
	Reading_Fademax = 2
	Readings_state = Readings_Intro

	local f = READINGS_LOAD[READINGS_DAY]
	if f then f() end
end

READINGS_LOAD[1] = function()
	Reading_Interactions_Index = 1
	Reading_Interactions = {
		Interaction_Hierophant,
		Interaction_Magician,
		Interaction_Fool,
	}

	Reading_Customers = {
		Characters[TheHierophant_BD],
		Characters[TheMagician_BD],
		Characters[TheFool_BD],
	}

	Reading_Customers_Cards = {
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
	}
end

READINGS_LOAD[2] = function()
	Reading_Interactions_Index = 1
	Reading_Interactions = {
		Interaction_Star,
		Interaction_Chariot,
		Interaction_Temperance,
	}

	Reading_Customers = {
		Characters[TheStar_BD],
		Characters[TheChariot_BD],
		Characters[Temperance_BD],
	}

	Reading_Customers_Cards = {
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
	}
end

function GoToArena()
	local song = Sound.get("shop")
	if song then
		song:stop()
	end
	local vo = Sound.get("voice_1")
	if vo then
		vo:stop()
	end

	Switch_State(ARENA)
end

Readings_Subupdate = {
	[Readings_Intro] = function(dt)
		
	end,

	[Readings_Crystal] = function(dt)
		
	end,

	[Readings_Card] = function(dt)
		local x,y = love.mouse.getPosition()
		Readings_Card_Button_1:focus(x,y)
		Readings_Card_Button_2:focus(x,y)
		Readings_Card_Button_3:focus(x,y)
		Readings_Card_Button_4:focus(x,y)
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
			Reading_Card_t = 0
			Reading_Card_fade = 0
			Reading_Card_dim = 0
			Reading_Fade = 0
			Reading_Dofade = false
			Reading_Fadereverse = false
			Readings_state = Readings_Crystal
		end
	end,

	[Readings_Crystal] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		if key == "space" then
			dialogue:next()
		end

		if key == "return" and dialogue:over() then
			Reading_Card_t = 0
			Reading_Card_fade = 0
			Reading_Card_dim = 0
			Reading_Fade = 0
			Reading_Dofade = false
			Reading_Fadereverse = false
			Readings_state = Readings_Card
		end
	end,

	[Readings_Card] = function(key)
		local cards = Reading_Customers_Cards[Reading_Interactions_Index]
		local v = {[2] = "Best", [1] = "Neutral", [-1] = "Bad", [-2] = "Worst"}
		if key == "1" then
			Reading_Player_Choice = v[TAROTCARDS[cards[1]].points] or "Worst"
			Readings_state = Readings_Results
		elseif key == "2" then
			Reading_Player_Choice = v[TAROTCARDS[cards[2]].points] or "Worst"
			Readings_state = Readings_Results
		elseif key == "3" then
			Reading_Player_Choice = v[TAROTCARDS[cards[3]].points] or "Worst"
			Readings_state = Readings_Results
		elseif key == "4" then
			Reading_Player_Choice = v[TAROTCARDS[cards[4]].points] or "Worst"
			Readings_state = Readings_Results
		end
	end,

	[Readings_Results] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Choices[Reading_Player_Choice]
		if key == "space" and dialogue:over() then
			Reading_Card_t = 0
			Reading_Card_fade = 0
			Reading_Card_dim = 0
			if not Reading_Dofade then
				Reading_Fade = 2
				Reading_Dofade = true
			end
		end

		if key == "space" then
			dialogue:next()
		end
	end,
}

Readings_Submousepressed = {
	[Readings_Intro] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if dialogue:over() then
			if ((x - 400)*(x - 400) + (y - 440)*(y - 440) < 50*50) then
				Reading_Card_t = 0
				Reading_Card_fade = 0
				Reading_Card_dim = 0
				Reading_Fade = 0
				Reading_Dofade = false
				Reading_Fadereverse = false
				Readings_state = Readings_Crystal
			end
		end
	end,

	[Readings_Crystal] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		if dialogue:over() then
			Reading_Card_t = 0
			Reading_Card_fade = 0
			Reading_Card_dim = 0
			Reading_Fade = 0
			Reading_Dofade = false
			Reading_Fadereverse = false
			Readings_state = Readings_Card
		end
	end,

	[Readings_Card] = function(x,y,button)
		local cards = Reading_Customers_Cards[Reading_Interactions_Index]
		local v = {[2] = "Best", [1] = "Neutral", [-1] = "Bad", [-2] = "Worst"}
		if Readings_Card_Button_1:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[1]].points] or "Worst"
			Readings_state = Readings_Results
		end
		if Readings_Card_Button_2:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[2]].points] or "Worst"
			Readings_state = Readings_Results
		end
		if Readings_Card_Button_3:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[3]].points] or "Worst"
			Readings_state = Readings_Results
		end
		if Readings_Card_Button_4:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[4]].points] or "Worst"
			Readings_state = Readings_Results
		end
	end,

	[Readings_Results] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Choices[Reading_Player_Choice]
		if dialogue:over() then
			Reading_Card_t = 0
			Reading_Card_fade = 0
			Reading_Card_dim = 0
			if not Reading_Dofade then
				Reading_Fade = 2
				Reading_Dofade = true
			end
		end
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
			love.graphics.setColor(0.97,0.7,0.97)
		elseif text.speaker == SPEAKER_BALL then
			love.graphics.setColor(0.97,0.97,0.7)
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

		if dialogue.index >= 3 then
			Reading_Card_fade = Reading_Card_fade + DT()
			local t = math.min(Reading_Card_fade,1)
			love.graphics.setColor(1,1,1,t)
			local cd = MAJORCARDS[customer.birth_date]
			if not(cd) or cd == "" then
				cd = "tm10"
			end
			img = Image.get(cd)
			love.graphics.draw(img,600,400,0,0.7)
			love.graphics.setColor(1,1,1)
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
			love.graphics.setColor(0.97,0.7,0.97)
		elseif text.speaker == SPEAKER_BALL then
			love.graphics.setColor(0.97,0.97,0.7)
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
			Reading_Card_dim = Reading_Card_dim + DT()
			local t = math.min(Reading_Card_dim,1)
			if i == 1 and Readings_Card_Button_1.f then
				love.graphics.setColor(0.8*t + (1- t),0.8*t + (1- t),0.8*t + (1- t))
			elseif i == 2 and Readings_Card_Button_2.f then
				love.graphics.setColor(0.8*t + (1- t),0.8*t + (1- t),0.8*t + (1- t))
			elseif i == 3 and Readings_Card_Button_3.f then
				love.graphics.setColor(0.8*t + (1- t),0.8*t + (1- t),0.8*t + (1- t))
			elseif i == 4 and Readings_Card_Button_4.f then
				love.graphics.setColor(0.8*t + (1- t),0.8*t + (1- t),0.8*t + (1- t))
			end
			TAROTCARDS[cards[i]]:draw(i,t)
			love.graphics.setColor(1,1,1)
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
		if dialogue:over() then
			customer.yap = false
		end

		customer:draw()
		local img = Image.get("dialogue_"..text.speaker)
		love.graphics.draw(img,0,-15,0,1,0.5)
		love.graphics.printf({{0,0,0},Text(text.text)},130,100,370,"left")

		if Reading_Dofade then
			if Reading_Fade >= 0 then
				local t = math.min(Reading_Fade/Reading_Fademax,1)
				if Reading_Fadereverse then
					love.graphics.setColor(0,0,0,math.min(t + 1, 1))
				else
					love.graphics.setColor(0,0,0,1 - t)
				end
				love.graphics.rectangle("fill",0,0,800,600)
				love.graphics.setColor(1,1,1)
				Reading_Fade = Reading_Fade - DT()
				if Reading_Fade <= 0 then
					if Reading_Fadereverse then
						Reading_Interactions_Index = Reading_Interactions_Index + 1
						if Reading_Interactions_Index > #Reading_Interactions then
							Reading_Interactions_Index = 1
							GoToArena()
						else
							Readings_state = Readings_Intro
						end
					else
						Reading_Fadereverse = true
						Reading_Fade = Reading_Fademax
					end
				end
			end
		end
	end,
}

LOAD[READINGS] = function()
	NextDay()
end

UPDATE[READINGS] = function(dt)
	local f = Readings_Subupdate[Readings_state]
	if f then f(dt) end
end

KEYPRESSED[READINGS] = function(key)
	local f = Readings_Subkeypressed[Readings_state]
	if f then f(key) end
end

MOUSEPRESSED[READINGS] = function(x,y,button)
	local f = Readings_Submousepressed[Readings_state]
	if f then f(x,y,button) end
end

DRAW[READINGS] = function()
	local song = Sound.get("shop")
	if song then
		song:setVolume(GAME_MUSIC_VOLUME)
		if not song:isPlaying() then
			song:play()
		end
	end
	love.graphics.setColor(1,1,1)
	local bg = Image.get("tent")
	love.graphics.draw(bg)

	local f = Readings_Subdraw[Readings_state]
	if f then f() end
end
