Karma = 0

function AddKarma(n)
    Karma = Karma + n
end

function SubtractKarma(n)
    Karma = Karma - n
end

function CheckKarma()
    if Karma > -40 and Karma < -15 then
		return 4
    elseif Karma > -15 and Karma < -5 then
		return 3
    elseif Karma > -5 and Karma < 20 then
		return 1
    elseif Karma > 20 and Karma < 40 then
		return 2
    end
end
