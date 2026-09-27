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
