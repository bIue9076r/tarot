require("reading_stuff.random")

Customer = {name = "Name", birth_date = 0, sprite = 0, yap = false}

function Customer.new(name, birth_date, sprite)
    local table = {name = name, birth_date = birth_date, sprite = sprite}

    local metaTable = {__index = Customer}

    return setmetatable(table, metaTable)
end

function Customer:animate()
	self.sprite = self.sprite + DT()
	if self.yap then
		local n = (math.floor(2*self.sprite) % 2) + 1
		local l = math.max((math.floor(self.sprite) % 5) - 3,0) * 2
		local img = Image.get("c"..self.birth_date.."_"..(n + l))
		love.graphics.draw(img)
	else
		local m = 2*(math.max(math.floor(self.sprite) % 5 - 3,0)) + 1
		local img = Image.get("c"..self.birth_date.."_"..(m))
		love.graphics.draw(img)
	end
end

--------------------------------------------------------

THE_MAGICIAN = Customer.new("The Magician", TheMagician_BD)
-- doctor

THE_HIGH_PRIESTESS = Customer.new("The High Priestess", TheHighPriestess_BD)
-- egotistical woman

THE_EMPRESS = Customer.new("The Empress", TheEmpress_BD)
-- businessman

THE_EMPEROR = Customer.new("The Emperor", TheEmperor_BD)
--the mayor

THE_HIEROPHANT = Customer.new("The Hierophant", TheHIerophant_BD)
--dancer

THE_LOVERS = Customer.new("The Lovers", TheLovers_BD)
--cheater

THE_CHARIOT = Customer.new("The Chariot", TheChariot_BD)
--high school student

STRENGTH = Customer.new("Strength", Strength_BD)
--wants to be a mermaid

THE_HERMIT = Customer.new("The Hermit", TheHermit_BD)
--boy with a crush

WHEEL_OF_FORTUNE = Customer.new("Wheel of Fortune", WheelOfFortune_BD)
--gambler

JUSTICE = Customer.new("Justice", Justice_BD)
--reformed prisoner

THE_HANGED_MAN = Customer.new("The Hanged Man", TheHangedMan_BD)
--celebrity

TEMPERANCE = Customer.new("Temperance", Temperance_BD)
-- beetroot enterpreneur

THE_DEVIL = Customer.new("The Devil", TheDevil_BD)
--a rule follower 

THE_TOWER = Customer.new("The Tower", TheTower_BD)
--a father who lost his son

THE_STAR = Customer.new("The Star", TheStar_BD)
--a patient in hospital

THE_MOON = Customer.new("The Monn", TheMoon_BD)
--alien

THE_SUN = Customer.new("The Sun", TheSun_BD)
--birthday

JUDGEMENT = Customer.new("Judgement", Judgement_BD)
--ut alumni

THE_WORLD = Customer.new("The World", TheWorld_BD)
--physchic

THE_FOOL = Customer.new("The Fool", TheFool_BD)
-- little girl

--------------------------------------------------------
