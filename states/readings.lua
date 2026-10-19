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
Reading_Ball_Glow = false

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

	Reading_Interactions_Index = 1
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

READINGS_LOAD[3] = function()
	Reading_Interactions = {
		Interaction_Hermit,
		Interaction_Lovers,
		Interaction_Devil,
	}

	Reading_Customers = {
		Characters[TheHermit_BD],
		Characters[TheLovers_BD],
		Characters[TheDevil_BD],
	}

	Reading_Customers_Cards = {
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
		RandomCards(READINGS_DAY),
	}
end

READINGS_LOAD[4] = function()
	Reading_Interactions = {
		Interaction_Moon,
		Interaction_HngedMan,
		Interaction_Empress,
	}

	Reading_Customers = {
		Characters[TheMoon_BD],
		Characters[TheHangedMan_BD],
		Characters[TheEmpress_BD],
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

-- Helper function to transition to Crystal
function ToCrystal()
	Reading_Card_t = 0
	Reading_Card_fade = 0
	Reading_Card_dim = 0
	Reading_Fade = 0
	Reading_Dofade = false
	Reading_Fadereverse = false
	Reading_Ball_Glow = false
	Readings_state = Readings_Crystal
end

-- Helper function to transition to Cards
function ToCard()
	Reading_Card_t = 0
	Reading_Card_fade = 0
	Reading_Card_dim = 0
	Reading_Fade = 0
	Reading_Dofade = false
	Reading_Fadereverse = false
	Reading_Ball_Glow = false
	Readings_state = Readings_Card
end

-- Helper function to transition from Results
function FromResults()
	Reading_Card_t = 0
	Reading_Card_fade = 0
	Reading_Card_dim = 0
	Reading_Ball_Glow = false
	if not Reading_Dofade then
		Reading_Fade = 2
		Reading_Dofade = true
	end
end

-- Substate Update functions
Readings_Subupdate = {
	[Readings_Intro] = function(dt)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if dialogue:over() then
			Reading_Ball_Glow = true
		end
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

-- Substate Keypressed functions
Readings_Subkeypressed = {
	[Readings_Intro] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if key == "space" then
			if not dialogue:over() then
				dialogue:next()
			else
				ToCrystal()
			end
		end

		if key == "return" and dialogue:over() then
			ToCrystal()
		end
	end,

	[Readings_Crystal] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		if key == "space" then
			if not dialogue:over() then
				dialogue:next()
			else
				ToCard()
			end
		end

		if key == "return" and dialogue:over() then
			ToCard()
		end
	end,

	[Readings_Card] = function(key)
		local cards = Reading_Customers_Cards[Reading_Interactions_Index]
		local v = {[2] = "Best", [1] = "Neutral", [-1] = "Bad", [-2] = "Worst"}
		if key == "1" then
			Reading_Player_Choice = v[TAROTCARDS[cards[1]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[1]].points)
		elseif key == "2" then
			Reading_Player_Choice = v[TAROTCARDS[cards[2]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[2]].points)
		elseif key == "3" then
			Reading_Player_Choice = v[TAROTCARDS[cards[3]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[3]].points)
		elseif key == "4" then
			Reading_Player_Choice = v[TAROTCARDS[cards[4]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[4]].points)
		end
	end,

	[Readings_Results] = function(key)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Choices[Reading_Player_Choice]

		if key == "space" then
			if not dialogue:over() then
				dialogue:next()
			else
				FromResults()
			end
		end
	end,
}

-- Substate Mousepressed functions
Readings_Submousepressed = {
	[Readings_Intro] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Intro
		if dialogue:over() then
			if ((x - 400)*(x - 400) + (y - 440)*(y - 440) < 50*50) then
				ToCrystal()
			end
		end
	end,

	[Readings_Crystal] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Crystal
		if dialogue:over() then
			ToCard()
		end
	end,

	[Readings_Card] = function(x,y,button)
		local cards = Reading_Customers_Cards[Reading_Interactions_Index]
		local v = {[2] = "Best", [1] = "Neutral", [-1] = "Bad", [-2] = "Worst"}
		if Readings_Card_Button_1:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[1]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[1]].points)
		end
		if Readings_Card_Button_2:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[2]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[2]].points)
		end
		if Readings_Card_Button_3:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[3]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[3]].points)
		end
		if Readings_Card_Button_4:click(x,y) then
			Reading_Player_Choice = v[TAROTCARDS[cards[4]].points] or "Worst"
			Readings_state = Readings_Results
			AddKarma(TAROTCARDS[cards[4]].points)
		end
	end,

	[Readings_Results] = function(x,y,button)
		local dialogue = Reading_Interactions[Reading_Interactions_Index].Choices[Reading_Player_Choice]
		if dialogue:over() then
			FromResults()
		end
	end,
}

-- Substate Draw functions
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

		customer:draw(Reading_Ball_Glow)
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

		customer:draw(Reading_Ball_Glow)
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
		customer:draw(Reading_Ball_Glow)
		for i = 1,4 do
			Reading_Card_t = Reading_Card_t + DT()
			local tc = math.min(Reading_Card_t,1)
			
			if 	(Readings_Card_Button_1.f) or (Readings_Card_Button_2.f) or
				(Readings_Card_Button_3.f) or (Readings_Card_Button_4.f) then
				Reading_Card_dim = Reading_Card_dim + DT()
			else
				Reading_Card_dim = 0
			end
			local t = math.min(Reading_Card_dim,1)
			if i == 1 and Readings_Card_Button_1.f then
				TAROTCARDS[cards[i]]:hint(i,t)
			elseif i == 2 and Readings_Card_Button_2.f then
				TAROTCARDS[cards[i]]:hint(i,t)
			elseif i == 3 and Readings_Card_Button_3.f then
				TAROTCARDS[cards[i]]:hint(i,t)
			elseif i == 4 and Readings_Card_Button_4.f then
				TAROTCARDS[cards[i]]:hint(i,t)
			end
			TAROTCARDS[cards[i]]:draw(i,tc)
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

		customer:draw(Reading_Ball_Glow)
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

-- Load the reading state
LOAD[READINGS] = function()
	-- To the next day
	NextDay()

	-- get that day's load function
	local f = READINGS_LOAD[READINGS_DAY]

	-- get the title song to stop
	local song = Sound.get("thePsychic")
	if song then
		if song:isPlaying() then
			song:stop()
		end
	end

	-- if it exists then call it
	if f then f() end
end

UPDATE[READINGS] = function(dt)
	-- if the substate has an update function run it
	local f = Readings_Subupdate[Readings_state]
	if f then f(dt) end
end

KEYPRESSED[READINGS] = function(key)
	if key == "escape" then
		local song = Sound.get("shop")
		if song then
			song:pause()
		end
		PauseState()
	end

	-- if the substate has an keypressed function run it
	local f = Readings_Subkeypressed[Readings_state]
	if f then f(key) end
end

MOUSEPRESSED[READINGS] = function(x,y,button)
	-- if the substate has an mousepressed function run it
	local f = Readings_Submousepressed[Readings_state]
	if f then f(x,y,button) end
end

DRAW[READINGS] = function()
	-- play the shop song
	local song = Sound.get("shop")
	if song then
		song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not song:isPlaying() then
			song:play()
		end
	end

	-- Draw the background tent
	love.graphics.setColor(1,1,1)
	local bg = Image.get("tent")
	love.graphics.draw(bg)

	-- if the substate has an draw function run it
	local f = Readings_Subdraw[Readings_state]
	if f then f() end
end
