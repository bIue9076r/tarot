require("reading_stuff.random")

Customer = {name = "Name", birth_date = 0, sprite = 0, yap = false}

function Customer.new(name, birth_date, sprite)
    local table = {name = name, birth_date = birth_date, sprite = sprite}

    local metaTable = {__index = Customer}

    return setmetatable(table, metaTable)
end

function Customer:draw()
	self.sprite = self.sprite + DT()
	if self.yap then
		local n = (math.floor(2*self.sprite) % 2) + 1
		local l = math.max((math.floor(self.sprite) % 5) - 3,0) * 2
		local img = Image.get("c"..self.birth_date.."_"..(n + l))
		local y = 5*math.sin(self.sprite*15)
		love.graphics.draw(img, 250, 180 + y)
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
    -- love.graphics.circle("fill", 400, 440, 50)
end

--------------------------------------------------------

Characters = {
    [TheMagician_BD] = Customer.new("The Magician", TheMagician_BD),
    -- doctor

    [TheHighPriestess_BD] = Customer.new("The High Priestess", TheHighPriestess_BD),
    -- egotistical woman

    [TheEmpress_BD] = Customer.new("The Empress", TheEmpress_BD),
    -- businessman

    [TheEmperor_BD] = Customer.new("The Emperor", TheEmperor_BD),
    --the mayor

    [TheHierophant_BD] = Customer.new("The Hierophant", TheHierophant_BD),
    --dancer

    [TheLovers_BD] = Customer.new("The Lovers", TheLovers_BD),
    --cheater

    [TheChariot_BD] = Customer.new("The Chariot", TheChariot_BD),
    --high school student

    [Strength_BD] = Customer.new("Strength", Strength_BD),
    --wants to be a mermaid

    [TheHermit_BD] = Customer.new("The Hermit", TheHermit_BD),
    --the councellor

    [WheelOfFortune_BD] = Customer.new("Wheel of Fortune", WheelOfFortune_BD),
    --gambler

    [Justice_BD] = Customer.new("Justice", Justice_BD),
    --reformed prisoner

    [TheHangedMan_BD] = Customer.new("The Hanged Man", TheHangedMan_BD),
    --celebrity

    [Temperance_BD] = Customer.new("Temperance", Temperance_BD),
    -- beetroot enterpreneur

    [TheDevil_BD] = Customer.new("The Devil", TheDevil_BD),
    --a rule follower 

    [TheTower_BD] = Customer.new("The Tower", TheTower_BD),
    --a father who lost his son

    [TheStar_BD] = Customer.new("The Star", TheStar_BD),
    --a patient in hospital

    [TheMoon_BD] = Customer.new("The Monn", TheMoon_BD),
    --alien

    [TheSun_BD] = Customer.new("The Sun", TheSun_BD),
    --birthday

    [Judgement_BD] = Customer.new("Judgement", Judgement_BD),
    --ut alumni

    [TheWorld_BD] = Customer.new("The World", TheWorld_BD),
    --physchic

    [TheFool_BD] = Customer.new("The Fool", TheFool_BD),
    -- little girl
}

--------------------------------------------------------
