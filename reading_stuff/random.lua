--------------------------------------------------------

TheMagician_BD = 1
TheHighPriestess_BD = 2
TheEmpress_BD = 3
TheEmperor_BD = 4
TheHierophant_BD = 5
TheLovers_BD = 6
TheChariot_BD = 7
Strength_BD = 8
TheHermit_BD = 9
WheelOfFortune_BD = 10
Justice_BD = 11
TheHangedMan_BD = 12
Temperance_BD = 14
TheDevil_BD = 15
TheTower_BD = 16
TheStar_BD = 17
TheMoon_BD = 18
TheSun_BD = 19
Judgement_BD = 20
TheWorld_BD = 21
TheFool_BD = 22

--------------------------------------------------------

function RandomCustomer()
    local list = {1, 3, 5, 6, 7, 9, 10, 12, 14, 17, 18, 22}
    local n = love.math.random(1,#list)
    return list[n]
end

function RandomCard()
    if READINGS_DAY == 1 then
        local card = love.math.random(1,5)
        return card
    elseif READINGS_DAY == 2 then
        local card = love.math.random(1,6)
        return card
    elseif READINGS_DAY == 3 then
        local card = love.math.random(1,7)
        return card
    elseif READINGS_DAY == 4 then
        local card = love.math.random(1,8)
        return card
    end
end