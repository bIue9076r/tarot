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

TheMagician_BD = 1
TheHighPriestess_BD = 2
TheEmpress_BD = 3
TheEmperor_BD = 4
TheHIerophant_BD = 5
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