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

-- THIRD DAY
Interaction_Hermit = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(121,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(122,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(123, SPEAKER_CHARACTER),
        Text.new(124, SPEAKER_CHARACTER),
        Text.new(125, SPEAKER_CHARACTER),
        Text.new(126, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(127, SPEAKER_PLAYER),
            Text.new(128, SPEAKER_CHARACTER),
            Text.new(129, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(130, SPEAKER_PLAYER),
            Text.new(131, SPEAKER_CHARACTER),
            Text.new(132, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(133, SPEAKER_PLAYER),
            Text.new(134, SPEAKER_CHARACTER),
            Text.new(135, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(136, SPEAKER_PLAYER),
            Text.new(137, SPEAKER_CHARACTER),
            Text.new(138, SPEAKER_CHARACTER),
            Text.new(139, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_Lovers = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(140,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(141,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(142, SPEAKER_CHARACTER),
        Text.new(143, SPEAKER_CHARACTER),
        Text.new(144, SPEAKER_CHARACTER),
        Text.new(145, SPEAKER_CHARACTER),
        Text.new(146, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(147, SPEAKER_PLAYER),
            Text.new(148, SPEAKER_CHARACTER),
            Text.new(149, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(150, SPEAKER_PLAYER),
            Text.new(151, SPEAKER_CHARACTER),
            Text.new(152, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(153, SPEAKER_PLAYER),
            Text.new(154, SPEAKER_CHARACTER),
            Text.new(155, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(156, SPEAKER_PLAYER),
            Text.new(157, SPEAKER_CHARACTER),
            Text.new(158, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_Devil = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(159,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(160,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(161, SPEAKER_CHARACTER),
        Text.new(162, SPEAKER_CHARACTER),
        Text.new(163, SPEAKER_CHARACTER),
        Text.new(164, SPEAKER_CHARACTER),
        Text.new(165, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(166, SPEAKER_PLAYER),
            Text.new(167, SPEAKER_CHARACTER),
            Text.new(168, SPEAKER_CHARACTER),
            Text.new(169, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(170, SPEAKER_PLAYER),
            Text.new(171, SPEAKER_CHARACTER),
            Text.new(172, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(173, SPEAKER_PLAYER),
            Text.new(174, SPEAKER_CHARACTER),
            Text.new(175, SPEAKER_CHARACTER),
            Text.new(176, SPEAKER_CHARACTER)
            
        }),
        Worst = Dialogue.new({
            Text.new(177, SPEAKER_PLAYER),
            Text.new(178, SPEAKER_CHARACTER),
            Text.new(179, SPEAKER_CHARACTER),
            Text.new(180, SPEAKER_CHARACTER)
        }),
    }
)

-- FOURTH DAY
Interaction_Moon = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(181,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(182,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(183, SPEAKER_CHARACTER),
        Text.new(184, SPEAKER_CHARACTER),
        Text.new(185, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(186, SPEAKER_PLAYER),
            Text.new(187, SPEAKER_CHARACTER),
            Text.new(188, SPEAKER_CHARACTER),
        }),
        Neutral = Dialogue.new({
            Text.new(189, SPEAKER_PLAYER),
            Text.new(190, SPEAKER_CHARACTER),
            Text.new(191, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(192, SPEAKER_PLAYER),
            Text.new(193, SPEAKER_CHARACTER),
            Text.new(194, SPEAKER_CHARACTER),
            
        }),
        Worst = Dialogue.new({
            Text.new(195, SPEAKER_PLAYER),
            Text.new(196, SPEAKER_CHARACTER),
            Text.new(197, SPEAKER_CHARACTER),
            Text.new(198, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_HngedMan = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(199,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(200,SPEAKER_CHARACTER),
        Text.new(201, SPEAKER_PLAYER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(202, SPEAKER_CHARACTER),
        Text.new(203, SPEAKER_CHARACTER),
        Text.new(204, SPEAKER_CHARACTER),
        Text.new(205, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(206, SPEAKER_PLAYER),
            Text.new(207, SPEAKER_CHARACTER),
            Text.new(208, SPEAKER_CHARACTER),
        }),
        Neutral = Dialogue.new({
            Text.new(209, SPEAKER_PLAYER),
            Text.new(210, SPEAKER_CHARACTER),
            Text.new(211, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(212, SPEAKER_PLAYER),
            Text.new(213, SPEAKER_CHARACTER),
            Text.new(214, SPEAKER_CHARACTER),
            
        }),
        Worst = Dialogue.new({
            Text.new(215, SPEAKER_PLAYER),
            Text.new(216, SPEAKER_CHARACTER),
            Text.new(217, SPEAKER_CHARACTER)
        }),
    }
)

Interaction_Empress = Interaction.new(
    -- Intro
    Dialogue.new({
        Text.new(218,SPEAKER_CHARACTER),
        Text.new(2,SPEAKER_PLAYER),
        Text.new(219,SPEAKER_CHARACTER),
        Text.new(4, SPEAKER_PLAYER)
    }),

    -- Crystal
    Dialogue.new({
        Text.new(220, SPEAKER_CHARACTER),
        Text.new(221, SPEAKER_CHARACTER),
        Text.new(222, SPEAKER_CHARACTER),
        Text.new(223, SPEAKER_BALL)
    }),

    {
        Best = Dialogue.new({
            Text.new(224, SPEAKER_PLAYER),
            Text.new(225, SPEAKER_CHARACTER),
            Text.new(226, SPEAKER_CHARACTER),
            Text.new(227, SPEAKER_CHARACTER)
        }),
        Neutral = Dialogue.new({
            Text.new(228, SPEAKER_PLAYER),
            Text.new(229, SPEAKER_CHARACTER),
            Text.new(230, SPEAKER_CHARACTER)
        }),
        Bad = Dialogue.new({
            Text.new(231, SPEAKER_PLAYER),
            Text.new(232, SPEAKER_CHARACTER),
            Text.new(233, SPEAKER_CHARACTER),
            
        }),
        Worst = Dialogue.new({
            Text.new(234, SPEAKER_PLAYER),
            Text.new(235, SPEAKER_CHARACTER),
            Text.new(236, SPEAKER_CHARACTER),
            Text.new(237, SPEAKER_CHARACTER)
        }),
    }
)

-- FIFTH DAY
