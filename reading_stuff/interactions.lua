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
    love.graphics.print(Text(general_table[Current_I][1]), 10, 20)
end

function Getspeaker(general_table)
    return general_table[Current_I].speaker
end

function PrintIntros(general_table)
    Printin(general_table)
end

function CheckBall(x,y,button)
    local r = 50
    local k = 350
    local h = 400
    if ((x - h)*(x - h) + (y - k)*(y - k)) < r*r then
        return true
    end
end


-- Intro 2
Intro2Hierophant = {
    {speaker=SPEAKER_CHARACTER, 5},
    {speaker=SPEAKER_CHARACTER, 6},
    {speaker=SPEAKER_CHARACTER, 7},
    {speaker=SPEAKER_BALL, 8}
}


-- CardPick
CardPickHierophant = {
    {speaker=SPEAKER_PLAYER, 9},
    {speaker=SPEAKER_PLAYER, 10},
    {speaker=SPEAKER_PLAYER, 11},
    {speaker=SPEAKER_CHARACTER, 12},
    {speaker=SPEAKER_CHARACTER, 13},
    {speaker=SPEAKER_PLAYER, 14},
    {speaker=SPEAKER_CHARACTER, 15},
    {speaker=SPEAKER_CHARACTER, 16},
    {speaker=SPEAKER_PLAYER, 17},
    {speaker=SPEAKER_CHARACTER, 18},
    {speaker=SPEAKER_PLAYER, 19},
    {speaker=SPEAKER_CHARACTER, 20},
    {speaker=SPEAKER_CHARACTER, 21}
}