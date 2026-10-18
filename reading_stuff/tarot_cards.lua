Tarot_Cards = {name = "tarot", points = 0, sprite = 0}

function Tarot_Cards.new(name, points, sprite)
    local table = {name = name, points = points, sprite = sprite}

    local metaTable = {__index = Tarot_Cards}

    return setmetatable(table, metaTable)
end

function Tarot_Cards:Px(n)
    if n == 1 then
        return -30
    elseif n == 2 then
        return 170
    elseif n == 3 then
        return 370
    elseif n == 4 then
        return 570
    end
end

function Tarot_Cards:Py(n)
    return 350
end

function Tarot_Cards:draw(n,t)
    local k = CheckKarma()
    local img = Image.get("t"..self.sprite.."v"..k)
    local ox = 270*(1 - t) + self:Px(n)*t
    local oy = 400*(1 - t) + self:Py(n)*t
	if img then
		love.graphics.draw(img, ox, oy, 0, 0.9)
	end
end

function Scramble(str,sev)
	local s = {}
	for i = 1,#str do
		table.insert(s,str:sub(i,i))
	end

	sev = sev or 20
	if sev < 2 then
		sev = 2
	end
	for i = 1,#s do
		if (math.random(1,sev) == sev) then
			local ri = math.random(1,#s)
			local c = s[i]
			
			s[i] = s[ri]
			s[ri] = c
		end
	end

	local sr = ""
	for i = 1,#s do
		sr = sr..s[i]
	end
	return sr
end

SCRAMBLE_K = 0.107295860829
SCRAMBLE_A = 5.84803547643

function Tarot_Cards:hint(n,t,card)
	local k = CheckKarma()
	local c = TEXTCOLORS[TAROTCARDS[card].points][k]
	local s = math.floor(math.min(math.max((SCRAMBLE_A)*math.exp((SCRAMBLE_K)*k),2),50))

	local ox = 15 + 200*(n - 1)
	local oy = 335
	love.graphics.setColor(0.67*t,0.58*t,0.38*t,1*t)
	love.graphics.rectangle("fill",ox,oy,170,50)
	love.graphics.setColor(1*t,1*t,1*t,1*t)
	love.graphics.print({c,Scramble(TAROTCARDS[card].name,s)},ox+10,oy+10)
	love.graphics.setColor(0.8*t + (1- t),0.8*t + (1- t),0.8*t + (1- t))
end

--------------------------------------------------------
TAROTCARDS = {
	Tarot_Cards.new("Ace of Swords", 2, 1),
	Tarot_Cards.new("Six of Swords", 1, 6),
	Tarot_Cards.new("Eight of Swords", -2, 2),
	Tarot_Cards.new("Knight of Swords", -1, 4),
	Tarot_Cards.new("Seven of Wands", 1, 5),
	Tarot_Cards.new("Ten of Wands", -2, 7),
	Tarot_Cards.new("Page of Wands", 2, 14),
	Tarot_Cards.new("Queen of Wands", 1, 15),
	Tarot_Cards.new("Two of Cups", 2, 16),
	Tarot_Cards.new("Three of Cups", 1, 8),
	Tarot_Cards.new("Five of Cups", -2, 9),
	Tarot_Cards.new("Nine of Cups", 2, 13),
	Tarot_Cards.new("King of Pentacles", 1, 12),
	Tarot_Cards.new("Four of Pentacles", -1, 3),
	Tarot_Cards.new("Ace of Pentacles", -2, 11),
	Tarot_Cards.new("Three of Pentacles", 1, 8),
	Tarot_Cards.new("Five of Pentacles", 1,10),
}

MAJORCARDS = {
	[TheMagician_BD] = "tm1",
	[TheHighPriestess_BD] = "",
	[TheEmpress_BD] = "tm3",
	[TheEmperor_BD] = "",
	[TheHierophant_BD] = "tm5",
	[TheLovers_BD] = "tm6",
	[TheChariot_BD] = "tm7",
	[Strength_BD] = "",
	[TheHermit_BD] = "tm9",
	[WheelOfFortune_BD] = "tm10",
	[Justice_BD] = "",
	[TheHangedMan_BD] = "tm12",
	[Temperance_BD] = "tm14",
	[TheDevil_BD] = "tm15",
	[TheTower_BD] = "tm16",
	[TheStar_BD] = "tm17",
	[TheMoon_BD] = "tm18",
	[TheSun_BD] = "",
	[Judgement_BD] = "tm20",
	[TheWorld_BD] = "",
	[TheFool_BD] = "",
}

TEXTCOLORS = {
	[-2] = {
		[2] = {1,0,0},
		[1] = {1,0.25,0.25},
		[3] = {0.9,0.7,0.7},
		[4] = {0.7,0.7,0.7},
	},

	[-1] = {
		[2] = {1,0.85,0.85},
		[1] = {0.9,0.85,0.85},
		[3] = {0.7,0.7,0.7},
		[4] = {0.7,0.7,0.7},
	},

	[1] = {
		[2] = {0.85,1,0.85},
		[1] = {0.85,0.9,0.85},
		[3] = {0.7,0.7,0.7},
		[4] = {0.7,0.7,0.7},
	},

	[2] = {
		[2] =  {0,1,0},
		[1] =  {0.25,0.8,0.25},
		[3] =  {0.7,0.8,0.7},
		[4] =  {0.7,0.7,0.7},
	},
}
