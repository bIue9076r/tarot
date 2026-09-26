require("reading_stuff.random")

Customer = {name = "Name", birth_date = "Bd", sprite = 0}

function Customer.new(name, birth_date, sprite)
    local table = {name = name, birth_date = birth_date, sprite = sprite}

    local metaTable = {__index = Customer}

    return setmetatable(table, metaTable)
end

--------------------------------------------------------

THE_FOOL = Customer.new("The Fool", TheFool_BD, 0)
-- little girl

THE_MAGICIAN = Customer.new("The Magician", TheMagician_BD, 0)
-- doctor

THE_HIGH_PRIESTESS = Customer.new("The High Priestess", TheHighPriestess_BD, 0)
-- egotistical woman

THE_EMPRESS = Customer.new("The Empress", TheEmpress_BD, 0)
-- businessman

THE_EMPEROR = Customer.new("The Emperor", TheEmperor_BD, 0)
--the mayor

THE_HIEROPHANT = Customer.new("The Hierophant", TheHIerophant_BD, 0)
--dancer

THE_LOVERS = Customer.new("The Lovers", TheLovers_BD, 0)
--cheater

THE_CHARIOT = Customer.new("The Chariot", TheChariot_BD, 0)
--high school student

STRENGTH = Customer.new("Strength", Strength_BD, 0)
--wants to be a mermaid

THE_HERMIT = Customer.new("The Hermit", TheHermit_BD, 0)
--boy with a crush

WHEEL_OF_FORTUNE = Customer.new("Wheel of Fortune", WheelOfFortune_BD, 0)
--gambler

JUSTICE = Customer.new("Justice", Justice_BD, 0)
--reformed prisoner

THE_HANGED_MAN = Customer.new("The Hanged Man", TheHangedMan_BD, 0)
--celebrity

TEMPERANCE = Customer.new("Temperance", Temperance_BD, 0)
-- beetroot enterpreneur

THE_DEVIL = Customer.new("The Devil", TheDevil_BD, 0)
--a rule follower 

THE_TOWER = Customer.new("The Tower", TheTower_BD, 0)
--a father who lost his son

THE_STAR = Customer.new("The Star", TheStar_BD, 0)
--a patient in hospital

THE_MOON = Customer.new("The Monn", TheMoon_BD, 0)
--alien

THE_SUN = Customer.new("The Sun", TheSun_BD, 0)
--birthday

JUDGEMENT = Customer.new("Judgement", Judgement_BD, 0)
--ut alumni

THE_WORLD = Customer.new("The World", TheWorld_BD, 0)
--physchic

--------------------------------------------------------
