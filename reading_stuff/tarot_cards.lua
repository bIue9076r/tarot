Tarot_Cards = {name = "tarot", points = 0, sprite = 0}

function Tarot_Cards.new(name, points, sprite)
    local table = {name = name, points = points, sprite = sprite}

    local metaTable = {__index = Tarot_Cards}

    return setmetatable(table, metaTable)
end

--------------------------------------------------------

ACE_OF_SWORDS = Tarot_Cards.new("Ace of Swords", 1, 0)

SIX_OF_SWORDS = Tarot_Cards.new("Six of Swords", 1, 0)

EIGHT_OF_SWORDS = Tarot_Cards.new("Eight of Swords", 1, 0)

KNIGHT_OF_SWORDS = Tarot_Cards.new("Knight of Swords", 1, 0)


SEVEN_OF_WANDS = Tarot_Cards.new("Seven of Wands", 1, 0)

TEN_OF_WANDS = Tarot_Cards.new("Ten of Wands", 1, 0)

PAGE_OF_WANDS = Tarot_Cards.new("Page of Wands", 1, 0)

QUEEN_OF_WANDS = Tarot_Cards.new("Queen of Wands", 1, 0)


TWO_OF_CUPS = Tarot_Cards.new("Two of Cups", 1, 0)

THREE_OF_CUPS = Tarot_Cards.new("Three of Cups", 1, 0)

FIVE_OF_CUPS = Tarot_Cards.new("Five of Cups", 1, 0)

NINE_OF_CUPS = Tarot_Cards.new("Nine of Cups", 1, 0)


KING_OF_PENTACLES = Tarot_Cards.new("King of Pentacles", 1, 0)

FOUR_OF_PENTACLES = Tarot_Cards.new("Four of Pentacles", 1, 0)

ACE_OF_PENTACLES = Tarot_Cards.new("Ace of Pentacles", 1, 0)

THREE_OF_PENTACLES = Tarot_Cards.new("Three of Pentacles", 1, 0)