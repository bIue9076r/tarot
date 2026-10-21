TUTORIAL_ARENA = 10

Last_Space = Space.new()
Last_Combo = Combo.new()
Last_Key = ""
Last_Idle_Time = 0
Last_Combo_Show = ""
Last_Combo_Show_T = 0
Last_Red = 0
Last_Intro = false

LOAD[TUTORIAL_ARENA] = function()
	Last_Space = Arena_Space
	Last_Combo = Arena_Combo
	Last_Key = Arena_Key
	Last_Idle_Time = Arena_Idle_Time
	Last_Combo_Show = Arena_Combo_Show
	Last_Combo_Show_T = Arena_Combo_Show_T
	Last_Red = Arena_Red
	Last_Intro = INTRO_PLAYED

	Arena_Space = Space.new()
	Arena_Space:add(Object.new(100,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	
	Arena_Space:add(Billboard.new("This is your player",25,400,{1,1,1},2))
	Arena_Space:add(Billboard.new("You can move with WASD",250,75,{1,1,1},2))
	Arena_Space:add(Billboard.new("or the arrow keys and space",250,120,{1,1,1},2))

	Arena_Space:add(Billboard.new("Keep going ->",600,400,{1,1,1},2))

	Arena_Space:add(Billboard.new("Spells are 'combos'",250 + 600,75,{1,1,1},2))
	Arena_Space:add(Billboard.new("you make with WASD",250 + 600,120,{1,1,1},2))

	Arena_Space:add(Billboard.new("W",370 + 600,200,{1,1,1},2))
	Arena_Space:add(Billboard.new("A",320 + 600,250,{1,1,1},2))
	Arena_Space:add(Billboard.new("S",370 + 600,300,{1,1,1},2))
	Arena_Space:add(Billboard.new("D",420 + 600,250,{1,1,1},2))

	Arena_Space:add(Billboard.new("Spells make shapes",250 + 1200,75,{1,1,1},2))
	Arena_Space:add(Billboard.new("This is a Right Wall",250 + 1200,120,{1,1,1},2))
	Arena_Space:add(Billboard.new("The order determines the direction (up or down)",150 + 1200,165,{1,1,1},2))

	Arena_Space:add(Billboard.new("W",370 + 1200,200,{1,1,1},2))
	Arena_Space:add(Billboard.new("A",320 + 1200,250,{1,1,1},2))
	Arena_Space:add(Billboard.new("S",370 + 1200,300,{1,1,1},2))
	Arena_Space:add(Billboard.new("D",420 + 1200,250,{1,1,1},2))

	Arena_Space:add(Billboard.new(".",330 + 1200,270,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",350 + 1200,285,{1,0,1},2))

	Arena_Space:add(Billboard.new(".",375 + 1200,220,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1200,240,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1200,260,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1200,280,{1,0,1},2))

	Arena_Space:add(Billboard.new("Other Shapes",600 + 1800,30,{1,1,1},2))

	Arena_Space:add(Billboard.new("W",370 + 1800,200,{1,1,1},2))
	Arena_Space:add(Billboard.new("A",320 + 1800,250,{1,1,1},2))
	Arena_Space:add(Billboard.new("S",370 + 1800,300,{1,1,1},2))
	Arena_Space:add(Billboard.new("D",420 + 1800,250,{1,1,1},2))

	Arena_Space:add(Billboard.new(".",375 + 1800,220,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1800,240,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1800,260,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",375 + 1800,280,{1,0,1},2))

	Arena_Space:add(Billboard.new("W",370 + 2000,200,{1,1,1},2))
	Arena_Space:add(Billboard.new("A",320 + 2000,250,{1,1,1},2))
	Arena_Space:add(Billboard.new("S",370 + 2000,300,{1,1,1},2))
	Arena_Space:add(Billboard.new("D",420 + 2000,250,{1,1,1},2))

	Arena_Space:add(Billboard.new("W",370 + 2000,200,{1,1,1},2))
	Arena_Space:add(Billboard.new("A",320 + 2000,250,{1,1,1},2))
	Arena_Space:add(Billboard.new("S",370 + 2000,300,{1,1,1},2))
	Arena_Space:add(Billboard.new("D",420 + 2000,250,{1,1,1},2))

	Arena_Space:add(Billboard.new(".",330 + 2000,270,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",350 + 2000,285,{1,0,1},2))

	Arena_Space:add(Billboard.new(".",410 + 2000,270,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",390 + 2000,285,{1,0,1},2))

	Arena_Space:add(Billboard.new(".",330 + 2000,230,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",350 + 2000,210,{1,0,1},2))

	Arena_Space:add(Billboard.new(".",410 + 2000,230,{1,0,1},2))
	Arena_Space:add(Billboard.new(".",390 + 2000,210,{1,0,1},2))

	Arena_Combo = Combo.new()
	Arena_Key = ""
	Arena_Combo_Show = ""
	Arena_Combo_Show_T = 0
	Arena_Idle_Time = 0
	Arena_Red = 0
	INTRO_PLAYED = false
end

UPDATE[TUTORIAL_ARENA] = function(dt)
-- check if the player moved left or right or up
	local moved = {x=false,y=false}
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		moved.x = Arena_Move_Left()
	elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		moved.x = Arena_Move_Right()
	end
	if love.keyboard.isDown("w") or love.keyboard.isDown("up") or love.keyboard.isDown("space") then
		moved.y = Arena_Move_Up()
	end
	if not moved.x then
		Arena_Move_None_X()
	end
	if not moved.y then
		Arena_Move_None_Y()
	end
	if moved.x or moved.y then
		Arena_Idle_Time = 0
	end
	if (not moved.x) and (not moved.y) then
		Arena_Idle_Time = Arena_Idle_Time + dt
	end
	Arena_Position()
	Arena_Move_Combo()

	-- if boss not killed
	for i,v in pairs(Arena_Space.objects) do
		if not(v.t == OBJ_TYPE_PLAYER) and not(v.t == OBJ_TYPE_BILLBOARD) then
			v:Position()
			-- this checks if any object hits anything in the space
			local c = Arena_Space:Collide(v)
			if c then
				-- if an enemy projectile hits the player
				if v.t == OBJ_TYPE_PROJECTILE_FOE and c.t == OBJ_TYPE_PLAYER then
					c.hp = c.hp - v.hp
					Arena_Space:remove(v)
					local s = Sound.get("crunch")
					if s then
						s:setVolume(Logarithming(GAME_SFX_VOLUME))
						if not s:isPlaying() then
							s:play()
						end
					end
				-- if a player projectile hits an enemy
				elseif v.t == OBJ_TYPE_PROJECTILE_JOE and c.t == OBJ_TYPE_ENEMY_1 then
					c.hp = c.hp - v.hp
					Arena_Space:remove(v)
				-- if a player projectile hits an enemy projectile
				elseif v.t == OBJ_TYPE_PROJECTILE_JOE and c.t == OBJ_TYPE_PROJECTILE_FOE then
					Arena_Space:remove(c)
				end
			end

			-- if any projectile hits a wall, remove it
			c = Arena_Space:CollideWall(v)
			if c then
				if not(v.t == OBJ_TYPE_ENEMY_1) then
					Arena_Space:remove(v)
				end
			end
		end
	end
end

KEYPRESSED[TUTORIAL_ARENA] = function(key)
	if key == "escape" then
		GAME_STATE = State_Return
		Arena_Space = Last_Space
		Arena_Combo = Last_Combo
		Arena_Key = Last_Key
		Arena_Idle_Time = Last_Idle_Time
		Arena_Combo_Show = Last_Combo_Show
		Arena_Combo_Show_T = Last_Combo_Show_T
		Arena_Red = Last_Red
		INTRO_PLAYED = Last_Intro

		local song = Sound.get("arenaTut")
		if song then
			song:stop()
		end

		local intro = Sound.get("arenaIntro")
		if intro then
			intro:stop()
		end
	end

	-- convert alternate keys to wasd
	if key == "space" then
		key = "w"
	end
	
	if key == "up" then
		key = "w"
	end

	if key == "left" then
		key = "a"
	end

	if key == "right" then
		key = "d"
	end

	-- Add key to combo and set current key
	if #Arena_Combo.moveset < 5 then
		Arena_Combo:addMove(key)
		Arena_Key = key
	end
end

MOUSEPRESSED[TUTORIAL_ARENA] = function(x,y,button)
	
end

DRAW[TUTORIAL_ARENA] = function()
	local song = Sound.get("arenaTut")
	local intro = Sound.get("arenaIntro")

	if song and intro then
		if not INTRO_PLAYED then
			intro:play()
			INTRO_PLAYED = true
		else
			song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
			if not song:isPlaying() and not intro:isPlaying() then
				song:play()
			end
		end
	end

	-- draw background
	Arena_BackParalax()
	Arena_Animate()
	Arena_Objects()
	Arena_FrontParalax()

	-- show player info
	Arena_KeyShow()
	if Arena_Combo_Show_T >= 0 then
		love.graphics.print(Arena_Combo_Show,0,30,0,2)
		Arena_Combo_Show_T = Arena_Combo_Show_T - DT()
	end

	Arena_Hp_Show()
end
