SPEAKER_PLAYER = 1
SPEAKER_CHARACTER = 2
SPEAKER_BALL = 3

-- Intro
IntroHierophant = {
    {speaker=SPEAKER_CHARACTER, 1},
    {speaker=SPEAKER_PLAYER, 2},
    {speaker=SPEAKER_CHARACTER, 3},
    {speaker=SPEAKER_PLAYER, 4},
}

Current_I = 1
function Printin(general_table)
    print(general_table[Current_I][1],Text(general_table[Current_I][1]))
end

function Getspeaker(general_table)
    return general_table[Current_I].speaker
end

function PrintIntros(general_table)
    love.graphics.circle("fill", 400, 350, 50)
    Printin(general_table)
end

function CheckBall(x,y,button)
    local r = 50
    local k = 350
    local h = 400
    if ((x - h)*(x - h) + (y - k)*(y - k)) < r*r then
        Is_Intro = false
        Is_Intro2 = true
        Current_TBL = Intro2Hierophant
        Current_I = 1
    end
end


-- Intro 2
Intro2Hierophant = {
    {speaker=SPEAKER_CHARACTER, 5},
    {speaker=SPEAKER_CHARACTER, 6},
    {speaker=SPEAKER_CHARACTER, 7},
    {speaker=SPEAKER_BALL, 8}
}
