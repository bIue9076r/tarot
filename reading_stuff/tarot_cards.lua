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
