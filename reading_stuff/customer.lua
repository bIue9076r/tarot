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
		love.graphics.draw(img, 250, 180)
        local v = Sound.get("voice_1")
        if v and (not v:isPlaying()) then
           v:play()
        end
	else
		local m = 2*(math.max(math.floor(self.sprite) % 5 - 3,0)) + 1
		local img = Image.get("c"..self.birth_date.."_"..(m))
		love.graphics.draw(img, 250, 180)
        local v = Sound.get("voice_1")
        if v then
           v:stop()
        end
	end
    local TABL = Image.get("table")
    love.graphics.draw(TABL)
    local BALLZ = Image.get("ball")
    love.graphics.draw(BALLZ)
    --love.graphics.circle("fill", 400, 440, 50)
end

--------------------------------------------------------

Characters = {
    Customer.new("The Magician", TheMagician_BD),
    -- doctor

    Customer.new("The High Priestess", TheHighPriestess_BD),
    -- egotistical woman

    Customer.new("The Empress", TheEmpress_BD),
    -- businessman

    Customer.new("The Emperor", TheEmperor_BD),
    --the mayor

    Customer.new("The Hierophant", TheHierophant_BD),
    --dancer

    Customer.new("The Lovers", TheLovers_BD),
    --cheater

    Customer.new("The Chariot", TheChariot_BD),
    --high school student

    Customer.new("Strength", Strength_BD),
    --wants to be a mermaid

    Customer.new("The Hermit", TheHermit_BD),
    --boy with a crush

    Customer.new("Wheel of Fortune", WheelOfFortune_BD),
    --gambler

    Customer.new("Justice", Justice_BD),
    --reformed prisoner

    Customer.new("The Hanged Man", TheHangedMan_BD),
    --celebrity

    Customer.new("Temperance", Temperance_BD),
    -- beetroot enterpreneur

    Customer.new("The Devil", TheDevil_BD),
    --a rule follower 

    Customer.new("The Tower", TheTower_BD),
    --a father who lost his son

    Customer.new("The Star", TheStar_BD),
    --a patient in hospital

    Customer.new("The Monn", TheMoon_BD),
    --alien

    Customer.new("The Sun", TheSun_BD),
    --birthday

    Customer.new("Judgement", Judgement_BD),
    --ut alumni

    Customer.new("The World", TheWorld_BD),
    --physchic

    Customer.new("The Fool", TheFool_BD),
    -- little girl
}

--------------------------------------------------------
