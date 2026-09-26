require("reading_stuff.random")

Customer = {name = "Name", birth_date = "Bd", sprite = 0}

function Customer.new(name, birth_date, sprite)
    local table = {name = name, birth_date = birth_date, sprite = sprite}

    local metaTable = {__index = Customer}

    return setmetatable(table, metaTable)
end

--------------------------------------------------------

THE_FOOL = Customer.new("The Fool", TheFool_BD, 0)

THE_MAGICIAN = Customer.new("The Magician", TheMagician_BD, 0)

THE_HIGH_PRIESTESS = Customer.new("The High Priestess", TheHighPriestess_BD, 0)

THE_EMPRESS = Customer.new("The Empress", TheEmpress_BD, 0)

THE_EMPEROR = Customer.new("The Emperor", TheEmperor_BD, 0)

THE_HIEROPHANT = Customer.new("The Hierophant", TheHIerophant_BD, 0)

THE_LOVERS = Customer.new("The Lovers", TheLovers_BD, 0)

THE_CHARIOT = Customer.new("The Chariot", TheChariot_BD, 0)

STRENGTH = Customer.new("Strength", Strength_BD, 0)

THE_HERMIT = Customer.new("The Hermit", TheHermit_BD, 0)

WHEEL_OF_FORTUNE = Customer.new("Wheel of Fortune", WheelOfFortune_BD, 0)

JUSTICE = Customer.new("Justice", Justice_BD, 0)

THE_HANGED_MAN = Customer.new("The Hanged Man", TheHangedMan_BD, 0)

TEMPERANCE = Customer.new("Temperance", Temperance_BD, 0)

THE_DEVIL = Customer.new("The Devil", TheDevil_BD, 0)

THE_TOWER = Customer.new("The Tower", TheTower_BD, 0)

THE_STAR = Customer.new("The Star", TheStar_BD, 0)

THE_MOON = Customer.new("The Monn", TheMoon_BD, 0)

THE_SUN = Customer.new("The Sun", TheSun_BD, 0)

JUDGEMENT = Customer.new("Judgement", Judgement_BD, 0)

THE_WORLD = Customer.new("The World", TheWorld_BD, 0)

--------------------------------------------------------
