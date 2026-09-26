-- birthday randomizer

function RandomBd()
    Month = love.math.random(12)

    if Month == 4 or 6 or 9 or 11 then
        Day = love.math.random(30)
    elseif Month == 2 then
        Day = love.math.random(29)
    else
        Day = love.math.random(31)
    end
    return {Month,Day}
end

--------------------------------------------------------

TheFool_BD = RandomBd()
TheMagician_BD = RandomBd()
TheHighPriestess_BD = RandomBd()
TheEmpress_BD = RandomBd()
TheEmperor_BD = RandomBd()
TheHIerophant_BD = RandomBd()
TheLovers_BD = RandomBd()
TheChariot_BD = RandomBd()
Strength_BD = RandomBd()
TheHermit_BD = RandomBd()
WheelOfFortune_BD = RandomBd()
Justice_BD = RandomBd()
TheHangedMan_BD = RandomBd()
Temperance_BD = RandomBd()
TheDevil_BD = RandomBd()
TheTower_BD = RandomBd()
TheStar_BD = RandomBd()
TheMoon_BD = RandomBd()
TheSun_BD = RandomBd()
Judgement_BD = RandomBd()
TheWorld_BD = RandomBd()

--------------------------------------------------------