SPEAKER_PLAYER = 1
SPEAKER_CHARACTER = 2
SPEAKER_BALL = 3

Text_t = {speaker = SPEAKER_PLAYER, text = 0}
function Text_t.new(t,s)
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
		Text_t.new(1,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(3,SPEAKER_CHARACTER),
		Text_t.new(4,SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(5,SPEAKER_CHARACTER),
		Text_t.new(6,SPEAKER_CHARACTER),
		Text_t.new(7,SPEAKER_CHARACTER),
		Text_t.new(8,SPEAKER_BALL),
	}),

	-- Choices
	{
		Best = Dialogue.new({
			Text_t.new(11,SPEAKER_PLAYER),
			Text_t.new(12,SPEAKER_CHARACTER),
			Text_t.new(13,SPEAKER_CHARACTER),
		}),

		Neutral = Dialogue.new({
			Text_t.new(14,SPEAKER_PLAYER),
			Text_t.new(15,SPEAKER_CHARACTER),
			Text_t.new(16,SPEAKER_CHARACTER),
		}),

		Bad = Dialogue.new({
			Text_t.new(17,SPEAKER_PLAYER),
			Text_t.new(18,SPEAKER_CHARACTER),
		}),

		Worst = Dialogue.new({
			Text_t.new(19,SPEAKER_PLAYER),
			Text_t.new(20,SPEAKER_CHARACTER),
			Text_t.new(21,SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Magician = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(22,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(23,SPEAKER_CHARACTER),
		Text_t.new(4,SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(24, SPEAKER_CHARACTER),
		Text_t.new(25, SPEAKER_CHARACTER),
		Text_t.new(26, SPEAKER_CHARACTER),
		Text_t.new(27, SPEAKER_CHARACTER),
		Text_t.new(28, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(29, SPEAKER_PLAYER),
			Text_t.new(30,SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(31, SPEAKER_PLAYER),
			Text_t.new(32, SPEAKER_CHARACTER),
			Text_t.new(33, SPEAKER_CHARACTER),
			Text_t.new(34, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(35, SPEAKER_PLAYER),
			Text_t.new(36, SPEAKER_CHARACTER),
			Text_t.new(37, SPEAKER_CHARACTER),
			Text_t.new(38, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(39, SPEAKER_PLAYER),
			Text_t.new(40, SPEAKER_CHARACTER),
			Text_t.new(41, SPEAKER_CHARACTER),
		   
		}),
	}
)

Interaction_Fool = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(42,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(43,SPEAKER_CHARACTER),
		Text_t.new(44,SPEAKER_PLAYER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(45, SPEAKER_CHARACTER),
		Text_t.new(46, SPEAKER_CHARACTER),
		Text_t.new(47, SPEAKER_CHARACTER),
		Text_t.new(48, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(49, SPEAKER_PLAYER),
			Text_t.new(50, SPEAKER_CHARACTER),
			Text_t.new(51, SPEAKER_CHARACTER),
			Text_t.new(52,SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(53, SPEAKER_PLAYER),
			Text_t.new(54, SPEAKER_CHARACTER),
			Text_t.new(55, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(56, SPEAKER_PLAYER),
			Text_t.new(57, SPEAKER_CHARACTER),
			Text_t.new(58, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(59, SPEAKER_PLAYER),
			Text_t.new(60, SPEAKER_CHARACTER),
			Text_t.new(61, SPEAKER_CHARACTER),
			Text_t.new(62, SPEAKER_CHARACTER),
		}),
	}
)


-- SECOND DAY
Interaction_Star = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(63,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(64,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(65, SPEAKER_CHARACTER),
		Text_t.new(66, SPEAKER_CHARACTER),
		Text_t.new(67, SPEAKER_CHARACTER),
		Text_t.new(68, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(69, SPEAKER_PLAYER),
			Text_t.new(70, SPEAKER_CHARACTER),
			Text_t.new(71, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(72, SPEAKER_PLAYER),
			Text_t.new(73, SPEAKER_CHARACTER),
			Text_t.new(74, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(75, SPEAKER_PLAYER),
			Text_t.new(76, SPEAKER_CHARACTER),
			Text_t.new(77, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(78, SPEAKER_PLAYER),
			Text_t.new(79, SPEAKER_CHARACTER),
			Text_t.new(80, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Chariot = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(81,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(82,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(83, SPEAKER_CHARACTER),
		Text_t.new(84, SPEAKER_CHARACTER),
		Text_t.new(85, SPEAKER_CHARACTER),
		Text_t.new(86, SPEAKER_CHARACTER),
		Text_t.new(87, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(88, SPEAKER_PLAYER),
			Text_t.new(89, SPEAKER_CHARACTER),
			Text_t.new(90, SPEAKER_CHARACTER),
			Text_t.new(91, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(92, SPEAKER_PLAYER),
			Text_t.new(93, SPEAKER_CHARACTER),
			Text_t.new(94, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(95, SPEAKER_PLAYER),
			Text_t.new(96, SPEAKER_CHARACTER),
			Text_t.new(97, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(98, SPEAKER_PLAYER),
			Text_t.new(99, SPEAKER_CHARACTER),
			Text_t.new(100, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Temperance = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(101,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(102,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(103, SPEAKER_CHARACTER),
		Text_t.new(104, SPEAKER_CHARACTER),
		Text_t.new(105, SPEAKER_CHARACTER),
		Text_t.new(106, SPEAKER_CHARACTER),
		Text_t.new(107, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(108, SPEAKER_PLAYER),
			Text_t.new(109, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(110, SPEAKER_PLAYER),
			Text_t.new(111, SPEAKER_CHARACTER),
			Text_t.new(112, SPEAKER_CHARACTER),
			Text_t.new(113, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(114, SPEAKER_PLAYER),
			Text_t.new(115, SPEAKER_CHARACTER),
			Text_t.new(116, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(117, SPEAKER_PLAYER),
			Text_t.new(118, SPEAKER_CHARACTER),
			Text_t.new(119, SPEAKER_CHARACTER),
			Text_t.new(120, SPEAKER_CHARACTER),
		}),
	}
)

-- THIRD DAY
Interaction_Hermit = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(121,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(122,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(123, SPEAKER_CHARACTER),
		Text_t.new(124, SPEAKER_CHARACTER),
		Text_t.new(125, SPEAKER_CHARACTER),
		Text_t.new(126, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(127, SPEAKER_PLAYER),
			Text_t.new(128, SPEAKER_CHARACTER),
			Text_t.new(129, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(130, SPEAKER_PLAYER),
			Text_t.new(131, SPEAKER_CHARACTER),
			Text_t.new(132, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(133, SPEAKER_PLAYER),
			Text_t.new(134, SPEAKER_CHARACTER),
			Text_t.new(135, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(136, SPEAKER_PLAYER),
			Text_t.new(137, SPEAKER_CHARACTER),
			Text_t.new(138, SPEAKER_CHARACTER),
			Text_t.new(139, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Lovers = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(140,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(141,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(142, SPEAKER_CHARACTER),
		Text_t.new(143, SPEAKER_CHARACTER),
		Text_t.new(144, SPEAKER_CHARACTER),
		Text_t.new(145, SPEAKER_CHARACTER),
		Text_t.new(146, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(147, SPEAKER_PLAYER),
			Text_t.new(148, SPEAKER_CHARACTER),
			Text_t.new(149, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(150, SPEAKER_PLAYER),
			Text_t.new(151, SPEAKER_CHARACTER),
			Text_t.new(152, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(153, SPEAKER_PLAYER),
			Text_t.new(154, SPEAKER_CHARACTER),
			Text_t.new(155, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(156, SPEAKER_PLAYER),
			Text_t.new(157, SPEAKER_CHARACTER),
			Text_t.new(158, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Devil = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(159,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(160,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(161, SPEAKER_CHARACTER),
		Text_t.new(162, SPEAKER_CHARACTER),
		Text_t.new(163, SPEAKER_CHARACTER),
		Text_t.new(164, SPEAKER_CHARACTER),
		Text_t.new(165, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(166, SPEAKER_PLAYER),
			Text_t.new(167, SPEAKER_CHARACTER),
			Text_t.new(168, SPEAKER_CHARACTER),
			Text_t.new(169, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(170, SPEAKER_PLAYER),
			Text_t.new(171, SPEAKER_CHARACTER),
			Text_t.new(172, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(173, SPEAKER_PLAYER),
			Text_t.new(174, SPEAKER_CHARACTER),
			Text_t.new(175, SPEAKER_CHARACTER),
			Text_t.new(176, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(177, SPEAKER_PLAYER),
			Text_t.new(178, SPEAKER_CHARACTER),
			Text_t.new(179, SPEAKER_CHARACTER),
			Text_t.new(180, SPEAKER_CHARACTER),
		}),
	}
)

-- FOURTH DAY
Interaction_Moon = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(181,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(182,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(183, SPEAKER_CHARACTER),
		Text_t.new(184, SPEAKER_CHARACTER),
		Text_t.new(185, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(186, SPEAKER_PLAYER),
			Text_t.new(187, SPEAKER_CHARACTER),
			Text_t.new(188, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(189, SPEAKER_PLAYER),
			Text_t.new(190, SPEAKER_CHARACTER),
			Text_t.new(191, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(192, SPEAKER_PLAYER),
			Text_t.new(193, SPEAKER_CHARACTER),
			Text_t.new(194, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(195, SPEAKER_PLAYER),
			Text_t.new(196, SPEAKER_CHARACTER),
			Text_t.new(197, SPEAKER_CHARACTER),
			Text_t.new(198, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_HngedMan = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(199,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(200,SPEAKER_CHARACTER),
		Text_t.new(201, SPEAKER_PLAYER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(202, SPEAKER_CHARACTER),
		Text_t.new(203, SPEAKER_CHARACTER),
		Text_t.new(204, SPEAKER_CHARACTER),
		Text_t.new(205, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(206, SPEAKER_PLAYER),
			Text_t.new(207, SPEAKER_CHARACTER),
			Text_t.new(208, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(209, SPEAKER_PLAYER),
			Text_t.new(210, SPEAKER_CHARACTER),
			Text_t.new(211, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(212, SPEAKER_PLAYER),
			Text_t.new(213, SPEAKER_CHARACTER),
			Text_t.new(214, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(215, SPEAKER_PLAYER),
			Text_t.new(216, SPEAKER_CHARACTER),
			Text_t.new(217, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_Empress = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(218,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(219,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(220, SPEAKER_CHARACTER),
		Text_t.new(221, SPEAKER_CHARACTER),
		Text_t.new(222, SPEAKER_CHARACTER),
		Text_t.new(223, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(224, SPEAKER_PLAYER),
			Text_t.new(225, SPEAKER_CHARACTER),
			Text_t.new(226, SPEAKER_CHARACTER),
			Text_t.new(227, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(228, SPEAKER_PLAYER),
			Text_t.new(229, SPEAKER_CHARACTER),
			Text_t.new(230, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(231, SPEAKER_PLAYER),
			Text_t.new(232, SPEAKER_CHARACTER),
			Text_t.new(233, SPEAKER_CHARACTER),
			
		}),
		Worst = Dialogue.new({
			Text_t.new(234, SPEAKER_PLAYER),
			Text_t.new(235, SPEAKER_CHARACTER),
			Text_t.new(236, SPEAKER_CHARACTER),
			Text_t.new(237, SPEAKER_CHARACTER),
		}),
	}
)

-- FIFTH DAY

Interaction_Judgement = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(238,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(239,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(240, SPEAKER_CHARACTER),
		Text_t.new(241, SPEAKER_CHARACTER),
		Text_t.new(242, SPEAKER_CHARACTER),
		Text_t.new(243, SPEAKER_CHARACTER),
		Text_t.new(244, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(245, SPEAKER_PLAYER),
			Text_t.new(246, SPEAKER_CHARACTER),
			Text_t.new(247, SPEAKER_CHARACTER),
			Text_t.new(248, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(249, SPEAKER_PLAYER),
			Text_t.new(250, SPEAKER_CHARACTER),
			Text_t.new(251, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(252, SPEAKER_PLAYER),
			Text_t.new(253, SPEAKER_CHARACTER),
			Text_t.new(254, SPEAKER_CHARACTER),
		}),
		Worst = Dialogue.new({
			Text_t.new(255, SPEAKER_PLAYER),
			Text_t.new(256, SPEAKER_CHARACTER),
			Text_t.new(257, SPEAKER_CHARACTER),
			Text_t.new(258, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_WheelOfFortune = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(259,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(260,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(261, SPEAKER_CHARACTER),
		Text_t.new(262, SPEAKER_CHARACTER),
		Text_t.new(263, SPEAKER_CHARACTER),
		Text_t.new(264, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(265, SPEAKER_PLAYER),
			Text_t.new(266, SPEAKER_CHARACTER),
			Text_t.new(267, SPEAKER_CHARACTER),
			Text_t.new(268, SPEAKER_CHARACTER),
			Text_t.new(269, SPEAKER_CHARACTER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(270, SPEAKER_PLAYER),
			Text_t.new(271, SPEAKER_CHARACTER),
			Text_t.new(272, SPEAKER_CHARACTER),
		}),
		Bad = Dialogue.new({
			Text_t.new(273, SPEAKER_PLAYER),
			Text_t.new(274, SPEAKER_CHARACTER),
			Text_t.new(275, SPEAKER_CHARACTER),
		}),
		Worst = Dialogue.new({
			Text_t.new(276, SPEAKER_PLAYER),
			Text_t.new(277, SPEAKER_CHARACTER),
			Text_t.new(278, SPEAKER_CHARACTER),
			Text_t.new(279, SPEAKER_CHARACTER),
		}),
	}
)

Interaction_TheTower = Interaction.new(
	-- Intro
	Dialogue.new({
		Text_t.new(280,SPEAKER_CHARACTER),
		Text_t.new(2,SPEAKER_PLAYER),
		Text_t.new(281,SPEAKER_CHARACTER),
		Text_t.new(4, SPEAKER_PLAYER),
	}),

	-- Crystal
	Dialogue.new({
		Text_t.new(282, SPEAKER_CHARACTER),
		Text_t.new(283, SPEAKER_CHARACTER),
		Text_t.new(284, SPEAKER_CHARACTER),
		Text_t.new(285, SPEAKER_CHARACTER),
		Text_t.new(286, SPEAKER_CHARACTER),
		Text_t.new(287, SPEAKER_BALL),
	}),

	{
		Best = Dialogue.new({
			Text_t.new(297, SPEAKER_PLAYER),
		}),
		Neutral = Dialogue.new({
			Text_t.new(297, SPEAKER_PLAYER),
		}),
		Bad = Dialogue.new({
			Text_t.new(297, SPEAKER_PLAYER),
		}),
		Worst = Dialogue.new({
			Text_t.new(297, SPEAKER_PLAYER),
		}),
	}
)
