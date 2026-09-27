SPEAKER_PLAYER = 1
SPEAKER_CHARACTER = 2
SPEAKER_BALL = 3

Text = {speaker = SPEAKER_PLAYER, text = 0}
function Text.new(t,s)
	return {text = t or 0, speaker = s or SPEAKER_CHARACTER}
end

Dialogue = {
	index = 1,
	textlist = {},
}

function Dialogue.new(texts)
	local tbl = {
		textlist = texts or {},
		index = 1,
	}

	local mt = {
		__index = Dialogue
	}

	return setmetatable(tbl,mt)
end

function Dialogue:get()
	local r = self.textlist[self.index]
	if r then
		return r
	end
end

function Dialogue:next()
	local r = self.textlist[self.index]
	if r then
		self.index = math.min(self.index + 1,#self.textlist)
		return r
	end
end

function Dialogue:over()
	return self.index >= #self.textlist
end

Interaction = {
	Intro = Dialogue.new(),
	Crystal = Dialogue.new(),
	Cards = {},
	Choices = {
		Best = Dialogue.new(),
		Neutral = Dialogue.new(),
		Bad = Dialogue.new(),
		Worst = Dialogue.new()
	},
}

function Interaction.new(intro,crystal,choices)
	local tbl = {
		Intro = intro or Dialogue.new(),
		Crystal = crystal or Dialogue.new(),
		Cards = {},
		Choices = choices or {
			Best = Dialogue.new(),
			Neutral = Dialogue.new(),
			Bad = Dialogue.new(),
			Worst = Dialogue.new()
		}
	}

	local mt = {
		__index = Interaction
	}

	return setmetatable(tbl,mt)
end

--------------------------------------------------------
-- Intro
-- FIRST DAY
Interaction_Hierophant = Interaction.new(
	-- Intro
	Dialogue.new({
		Text.new(1,SPEAKER_CHARACTER),
		Text.new(2,SPEAKER_PLAYER),
		Text.new(3,SPEAKER_CHARACTER),
		Text.new(4,SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text.new(5,SPEAKER_CHARACTER),
		Text.new(6,SPEAKER_CHARACTER),
		Text.new(7,SPEAKER_CHARACTER),
		Text.new(8,SPEAKER_BALL),
	}),

	-- Choices
	{
		Best = Dialogue.new({
			Text.new(11,SPEAKER_PLAYER),
			Text.new(12,SPEAKER_CHARACTER),
			Text.new(13,SPEAKER_CHARACTER),
		}),

		Neutral = Dialogue.new({
			Text.new(14,SPEAKER_PLAYER),
			Text.new(15,SPEAKER_CHARACTER),
			Text.new(16,SPEAKER_CHARACTER),
		}),

		Bad = Dialogue.new({
			Text.new(17,SPEAKER_PLAYER),
			Text.new(18,SPEAKER_CHARACTER),
		}),

		Worst = Dialogue.new({
			Text.new(19,SPEAKER_PLAYER),
			Text.new(20,SPEAKER_CHARACTER),
			Text.new(21,SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Magician = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(22,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(23,SPEAKER_CHARACTER),
        Text.new(4,SPEAKER_PLAYER),
    }),

    -- Crystal
    Dialogue.new({
        Text.new(24, SPEAKER_CHARACTER),
        Text.new(25, SPEAKER_CHARACTER),
        Text.new(26, SPEAKER_CHARACTER),
        Text.new(27, SPEAKER_CHARACTER),
        Text.new(28, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(29, SPEAKER_PLAYER),
            Text.new(30,SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(31, SPEAKER_PLAYER),
            Text.new(32, SPEAKER_CHARACTER),
            Text.new(33, SPEAKER_CHARACTER),
            Text.new(34, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(35, SPEAKER_PLAYER),
            Text.new(36, SPEAKER_CHARACTER),
            Text.new(37, SPEAKER_CHARACTER),
            Text.new(38, SPEAKER_CHARACTER),
            
        }),
        Worst = Dialogue.new({
            Text.new(39, SPEAKER_PLAYER),
            Text.new(40, SPEAKER_CHARACTER),
            Text.new(41, SPEAKER_CHARACTER)
           
        }),
    }
)

Interaction_Fool = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(42,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(43,SPEAKER_CHARACTER),
        Text.new(44,SPEAKER_PLAYER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(45, SPEAKER_CHARACTER),
        Text.new(46, SPEAKER_CHARACTER),
        Text.new(47, SPEAKER_CHARACTER),
        Text.new(48, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(49, SPEAKER_PLAYER),
            Text.new(50, SPEAKER_CHARACTER),
            Text.new(51, SPEAKER_CHARACTER),
            Text.new(52,SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(53, SPEAKER_PLAYER),
            Text.new(54, SPEAKER_CHARACTER),
            Text.new(55, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(56, SPEAKER_PLAYER),
            Text.new(57, SPEAKER_CHARACTER),
            Text.new(58, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(59, SPEAKER_PLAYER),
            Text.new(60, SPEAKER_CHARACTER),
            Text.new(61, SPEAKER_CHARACTER),
            Text.new(62, SPEAKER_CHARACTER)
        }),
    }
)


-- SECOND DAY
Interaction_Star = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(63,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(64,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(65, SPEAKER_CHARACTER),
        Text.new(66, SPEAKER_CHARACTER),
        Text.new(67, SPEAKER_CHARACTER),
        Text.new(68, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(69, SPEAKER_PLAYER),
            Text.new(70, SPEAKER_CHARACTER),
            Text.new(71, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(72, SPEAKER_PLAYER),
            Text.new(73, SPEAKER_CHARACTER),
            Text.new(74, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(75, SPEAKER_PLAYER),
            Text.new(76, SPEAKER_CHARACTER),
            Text.new(77, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(78, SPEAKER_PLAYER),
            Text.new(79, SPEAKER_CHARACTER),
            Text.new(80, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_Chariot = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(81,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(82,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(83, SPEAKER_CHARACTER),
        Text.new(84, SPEAKER_CHARACTER),
        Text.new(85, SPEAKER_CHARACTER),
        Text.new(86, SPEAKER_CHARACTER),
        Text.new(87, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(88, SPEAKER_PLAYER),
            Text.new(89, SPEAKER_CHARACTER),
            Text.new(90, SPEAKER_CHARACTER),
            Text.new(91, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(92, SPEAKER_PLAYER),
            Text.new(93, SPEAKER_CHARACTER),
            Text.new(94, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(95, SPEAKER_PLAYER),
            Text.new(96, SPEAKER_CHARACTER),
            Text.new(97, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(98, SPEAKER_PLAYER),
            Text.new(99, SPEAKER_CHARACTER),
            Text.new(100, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_Temperance = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(101,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(102,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(103, SPEAKER_CHARACTER),
        Text.new(104, SPEAKER_CHARACTER),
        Text.new(105, SPEAKER_CHARACTER),
        Text.new(106, SPEAKER_CHARACTER),
        Text.new(107, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(108, SPEAKER_PLAYER),
            Text.new(109, SPEAKER_CHARACTER),
        }),
        Neutral = Dialogue.new({
            Text.new(110, SPEAKER_PLAYER),
            Text.new(111, SPEAKER_CHARACTER),
            Text.new(112, SPEAKER_CHARACTER),
            Text.new(113, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(114, SPEAKER_PLAYER),
            Text.new(115, SPEAKER_CHARACTER),
            Text.new(116, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(117, SPEAKER_PLAYER),
            Text.new(118, SPEAKER_CHARACTER),
            Text.new(119, SPEAKER_CHARACTER),
            Text.new(120, SPEAKER_CHARACTER)
        }),
    }
)
