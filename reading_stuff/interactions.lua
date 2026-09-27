SPEAKER_PLAYER = 1
SPEAKER_CHARACTER = 2
SPEAKER_BALL = 3

Text = {speaker = SPEAKER_PLAYER, text = ""}
function Text.new(t,s)
	return {text = t or "", speaker = s or SPEAKER_CHARACTER}
end

Dialogue = {
	index = 0,
	textlist = {},
}
function Dialogue.new(texts)
	local tbl = {
		textlist = texts or {},
		index = 0,
	}

	local mt = {
		__index = Dialogue
	}

	return setmetatable(tbl,mt)
end

function Dialogue:next()
	local r = self.textlist[self.index]
	if r then
		self.index = math.min(self.index + 1,#self.textlist)
		return r
	end
end

Interaction = {
	Intro = Dialogue.new(),
	Crystal = Dialogue.new(),
	Cards = {},
	Choices = Dialogue.new(),
}

Current_I = 1
function Printin(general_table)
    love.graphics.print(Text(general_table[Current_I][1]), 10, 20)
end

function Getspeaker(general_table)
    return general_table[Current_I].speaker
end

function GetResponseSpeaker()
    return
end

function PrintIntros(general_table)
    Printin(general_table)
end

function CheckBall(x,y,button)
    local r = 50
    local k = 440
    local h = 400
    if ((x - h)*(x - h) + (y - k)*(y - k)) < r*r then
        return true
    end
end

function SetTable()
    if Is_Intro then
        Current_TBL = All_Tables[Current_C][1]
    elseif Is_Intro2 then
        Current_TBL = All_Tables[Current_C][2]
    elseif Is_CardPick then
        Current_TBL = All_Tables[Current_C][3]
    end
end

function SetResponse()
    if Is_Response then
        if PICK == 2 then
            Current_TBL = All_Tables[Current_C][3][2][Current_I][1]
        elseif PICK == 1 then
            Current_TBL = All_Tables[Current_C][3][3][Current_I][1]
        elseif PICK == -1 then
            Current_TBL = All_Tables[Current_C][3][4][Current_I][1]
        elseif PICK == -2 then
            Current_TBL = All_Tables[Current_C][3][5][Current_I][1]
        end
    end
end

function CheckCard(key)
    if key == "1" then
        PICK = Cust[Current_C][1].points
    elseif key == "2" then
        PICK = Cust[Current_C][2].points
    elseif key == "3" then
        PICK = Cust[Current_C][3].points
    elseif key == "4" then
        PICK = Cust[Current_C][4].points
    end
    Karma = Karma + PICK
    Is_CardPick = false
    Is_Response = true
end

function DrawResponse()
    if PICK == 2 then
        love.graphics.print(Text(All_Tables[Current_C][3][2][Current_I][1]), 10, 20)
    elseif PICK == 1 then
        love.graphics.print(Text(All_Tables[Current_C][3][3][Current_I][1]), 10, 20)
    elseif PICK == -1 then
        love.graphics.print(Text(All_Tables[Current_C][3][4][Current_I][1]), 10, 20)
    elseif PICK == -2 then
        love.graphics.print(Text(All_Tables[Current_C][3][5][Current_I][1]), 10, 20)
    end
end

--------------------------------------------------------
-- Intro
All_Tables = {
    { -- HIEROPHANT
        { -- Intro Hierophant
            {speaker=SPEAKER_CHARACTER, 1},
            {speaker=SPEAKER_PLAYER, 2},
            {speaker=SPEAKER_CHARACTER, 3},
            {speaker=SPEAKER_PLAYER, 4},
        },
        { --Intro2 Hierophant 
            {speaker=SPEAKER_CHARACTER, 5},
            {speaker=SPEAKER_CHARACTER, 6},
            {speaker=SPEAKER_CHARACTER, 7},
            {speaker=SPEAKER_BALL, 8}
        },
        { -- Card Pick Hierophant
            { -- while picking
                {speaker=SPEAKER_PLAYER, 9},
                {speaker=SPEAKER_PLAYER, 10},
            },
            { -- Best choice
                {speaker=SPEAKER_PLAYER, 11},
                {speaker=SPEAKER_CHARACTER, 12},
                {speaker=SPEAKER_CHARACTER, 13},
            },
            { -- Neutral choice
                {speaker=SPEAKER_PLAYER, 14},
                {speaker=SPEAKER_CHARACTER, 15},
                {speaker=SPEAKER_CHARACTER, 16},
            },
            { -- Bad choice
                {speaker=SPEAKER_PLAYER, 17},
                {speaker=SPEAKER_CHARACTER, 18},
            },
            { -- The worst choice
                {speaker=SPEAKER_PLAYER, 19},
                {speaker=SPEAKER_CHARACTER, 20},
                {speaker=SPEAKER_CHARACTER, 21}
            }
        }
    },
    { -- 
        { -- Intro
            {speaker=SPEAKER_CHARACTER, 22},
            {speaker=SPEAKER_PLAYER, 23},
            {speaker=SPEAKER_CHARACTER, 24},
            {speaker=SPEAKER_PLAYER, 25}
        },
        { -- Intro 2
            {speaker=SPEAKER_CHARACTER, 26},
            {speaker=SPEAKER_BALL, 27}

        },
        { -- Card Pick
            {speaker=SPEAKER_PLAYER, 9},
            {speaker=SPEAKER_PLAYER, 10},
            {speaker=SPEAKER_PLAYER, 28},
            {speaker=SPEAKER_CHARACTER, 29},
            {speaker=SPEAKER_PLAYER, 30},
            {speaker=SPEAKER_CHARACTER, 31},
            {speaker=SPEAKER_PLAYER, 32},
            {speaker=SPEAKER_CHARACTER, 33},
            {speaker=SPEAKER_PLAYER, 34},
            {speaker=SPEAKER_CHARACTER, 35}
        }

    },
}

-- Interaction_Hierophant = Interaction.new(
-- 	Dialogue.new(),
-- 	Dialogue.new()
-- )