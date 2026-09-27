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
    local list = {
		TheMagician_BD, TheEmpress_BD, TheHierophant_BD, TheLovers_BD,
		TheChariot_BD, TheHermit_BD, WheelOfFortune_BD, TheHangedMan_BD,
		Temperance_BD, TheDevil_BD, TheTower_BD, TheStar_BD, TheMoon_BD,
		Judgement_BD, TheFool_BD,
	}
    local n = love.math.random(1,#list)
    return list[n]
end

function Duplicate(tbl,val)
	for i,v in pairs(tbl) do
		if(v == val) then
			return true
		end
	end
	return false
end

function RandomCards(day)
	local tbl = {}
	for i = 1,4 do
		local n = love.math.random(1,4 + day)
		if Duplicate(tbl,n) then
			for _ = 1,5 do
				n = love.math.random(1,4 + day)
				if not Duplicate(tbl,n) then
					break
				end
			end
		else
			table.insert(tbl,n)
		end
	end

	return tbl
end