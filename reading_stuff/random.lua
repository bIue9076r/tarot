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

TheFool_BD = 1
TheMagician_BD = 2
TheHighPriestess_BD = 3
TheEmpress_BD = 4
TheEmperor_BD = 5
TheHIerophant_BD = 6
TheLovers_BD = 7
TheChariot_BD = 8
Strength_BD = 9
TheHermit_BD = 10
WheelOfFortune_BD = 11
Justice_BD = 12
TheHangedMan_BD = 13
Temperance_BD = 14
TheDevil_BD = 15
TheTower_BD = 16
TheStar_BD = 17
TheMoon_BD = 18
TheSun_BD = 19
Judgement_BD = 20
TheWorld_BD = 21

--------------------------------------------------------