require("arena/space") -- World Physics modules
require("arena/combo") -- Combo module
ARENA = 4

Arena_Space = Space.new() -- New Physics Space

-- Max Speed
Arena_Max_Velocity_X = 100
Arena_Max_Velocity_Y = 400

-- Current combo
Arena_Combo = Combo.new()

Empty_Combo = Combo.new()

-- Delay between key input
Arena_Combo_Delay = 0.1875

-- Combo string
Arena_Combo_Show = ""

-- Combo show timer
Arena_Combo_Show_T = 0
Arena_Combo_Show_Delay = 2

-- Animation states
PLAYER_IDLE_IMPATIENT = -1
PLAYER_IDLE = 0
PLAYER_RIGHT = 1
PLAYER_LEFT = 2
PLAYER_DOWN = 3
PLAYER_JUMP = 4
PLAYER_FLOAT = 5
PLAYER_FALL = 6
PLAYER_SLIDE_RIGHT = 7
PLAYER_SLIDE_LEFT = 8
OBJ_TYPE_PLAYER = 1

Arena_Idle_Time = 0
Arena_Idle_Time_Max = 5
Arena_Dead = 0
Arena_Ending = 0

Arena_Key = ""

Arena_Combo_List = ComboList.new({
	{name = "Aireal Circle", cmb = Combo.new({"w","d","w","a","s"})},
	{name = "Aireal Circle", cmb = Combo.new({"w","w","a","s","d"})},
	{name = "Aireal Circle", cmb = Combo.new({"w","a","s","d","w"})},
	{name = "Aireal Circle", cmb = Combo.new({"w","s","d","w","a"})},
	{name = "Aireal Circle", cmb = Combo.new({"w","d","w","a","s"})},

	{name = "Ground Circle", cmb = Combo.new({"d","w","a","s"})},
	{name = "Ground Circle", cmb = Combo.new({"w","a","s","d"})},
	{name = "Ground Circle", cmb = Combo.new({"a","s","d","w"})},
	{name = "Ground Circle", cmb = Combo.new({"s","d","w","a"})},

	{name = "Down Wave Right", cmb = Combo.new({"d","w","s"})},
	{name = "Down Wave Left", cmb = Combo.new({"a","w","s"})},

	{name = "Up Wave Right", cmb = Combo.new({"d","s","w"})},
	{name = "Up Wave Left", cmb = Combo.new({"a","s","w"})},

	{name = "Down Wall", cmb = Combo.new({"w","s"})},
	{name = "Up Wall", cmb = Combo.new({"s","w"})},

	{name = "Right Blast", cmb = Combo.new({"d","d"})},
	{name = "Left Blast", cmb = Combo.new({"a","a"})},
})

Arena_Combo_Enact = {
	-- Circle blast around the player
	["Ground Circle"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		for i = 1,11 do
			Arena_Space:add(Projectile.joe(15,A.x,A.y,5,5,-math.pi * (i - 1)/10,400))
		end
	end,

	["Aireal Circle"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		for i = 1,20 do
			Arena_Space:add(Projectile.joe(20,A.x,A.y,5,5,-math.pi * (i - 1)/10,400))
		end
	end,

	-- Horizontal plane down from the player
	["Down Wall"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x - 5,A.y,42,5,math.pi/2,400))
	end,

	-- Horizontal plane up from the player
	["Up Wall"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x - 5,A.y,42,5,-math.pi/2,400))
	end,

	-- Vertical plane right from the player
	-- Also boosts them up and left
	["Up Wave Right"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y - 5,5,42,0,400))
		A.vx = A.vx - 250
		A.vy = A.vy - 150
	end,

	-- Vertical plane left from the player
	-- Also boosts them up and right
	["Up Wave Left"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y - 5,5,42,math.pi,400))
		A.vx = A.vx + 250
		A.vy = A.vy - 150
	end,

	-- Vertical plane right from the player
	-- Also boosts them down
	["Down Wave Right"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y - 5,5,42,0,400))
		A.vy = A.vy + 150
	end,

	-- Vertical plane left from the player
	-- Also boosts them down
	["Down Wave Left"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y - 5,5,42,math.pi,400))
		A.vy = A.vy + 150
	end,

	-- Blast to the right
	-- Also boosts the player left
	["Right Blast"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y + 16,5,5,0,400))
		A.vx = A.vx - 150
	end,

	-- Blast to the left
	-- Also boosts the player right
	["Left Blast"] = function()
		local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
		Arena_Space:add(Projectile.joe(10,A.x,A.y + 16,5,5,math.pi,400))
		A.vx = A.vx + 150
	end,
}

function Sign(n)
	if n > 0 then
		return 1
	elseif n < 0 then
		return -1
	end

	return 0
end

function Lerp(t,a,c,b,d)
	-- (a,b) to (c,d)
	a = a or 0
	b = b or 0
	c = c or 1
	d = d or 0

	if(a - c == 0) then
		return 0
	end

	local m = (d - b)/(c - a)
	return m*(t - a) + b
end

-- Custom Player Physics functions

-- Check if player hits a wall or projectile
function Arena_Collision(A)
	A = A or Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	local nx = A.nx
	local ny = A.ny

	if nx <= 1 then
		A.nx = A.x
		A.vx = - A.vx
	end
	if nx >= 2700 then
		A.nx = A.x
		A.vx = - A.vx
	end

	local vt = Arena_Space:PreCollideWallT(A)
	if vt then
		for i, v in pairs(vt) do
			if(A.ny + A.h > v.y) or (A.ny < v.y + v.h) then
				A.ny = A.y
				
				if (A.nx < v.x + v.w) or (A.nx + A.w > v.x) then
					A.falling = false
					A.nx = A.x
					if(Arena_Space:CollideWallOff(A,2,0)) or Arena_Space:CollideWallOff(A,-2,0) then
						A.vx = -0.25 * A.vx
					end
				end
			end
		end
	else
		if A.vy > 0 then
			A.falling = true
		else
			if (A.vy == 0) and (not Arena_Space:CollideWallOff(A,0,2)) then
				A.falling = true
			end
		end
	end
end

-- Move the player in the up direction
-- Jump
function Arena_Move_Up()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then
		A:AUp(Arena_Space.G);
		A.state = PLAYER_JUMP
		if A.falling then
			return false
		end

		return true
	end
end

-- Move the player in the down direction
function Arena_Move_Down()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then A:ADown(); A.state = PLAYER_DOWN end
end

-- Move the player to the left
function Arena_Move_Left()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then A:ALeft(); A.state = PLAYER_LEFT end
	return true
end

-- Move the player to the right
function Arena_Move_Right()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then A:ARight(); A.state = PLAYER_RIGHT end
	return true
end

-- Paralax the world based on the player
function Arena_Position()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then
		A:PrePosition()
		Arena_Collision(A)
		A:Position()
		
		Arena_Space.Xlax = math.min(math.max(A.x - 200,0),2000)
		-- Arena_Space.Ylax = math.max(A.y - 200,0)
	end
end

-- No x acceleration
function Arena_Move_None_X()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then
		A:ANoneX()
		if (A.vy == 0) and (A.vx == 0) then
			if Arena_Idle_Time <= Arena_Idle_Time_Max then
				A.state = PLAYER_IDLE
			end
		else
			if A.vx < 0 then
				A.state = PLAYER_SLIDE_RIGHT
			else
				A.state = PLAYER_SLIDE_LEFT
			end
		end
	end
end

-- No y acceleration
function Arena_Move_None_Y()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then		
		A:ANoneY(Arena_Space.G)
		if (A.vy == 0) and (A.vx == 0) then
			if Arena_Idle_Time <= Arena_Idle_Time_Max then
				A.state = PLAYER_IDLE
			end
		else
			if A.vy > 0 then
				A.state = PLAYER_FLOAT
			end
		end
	end
end

function Arena_Move_Combo()
	-- Cool down for break combo
	local dt = DT()
	Arena_Combo.fresh = Arena_Combo.fresh + dt
	if Arena_Combo.fresh >= Arena_Combo_Delay then
		Arena_Combo_List:validate(Arena_Combo)
		if not Arena_Combo:compare(Empty_Combo) then
			local combo = "Combo: "
			local cmb = Arena_Combo_List:compare(Arena_Combo)
			if cmb then
				combo = combo..cmb.name.." ("
				for i,v in ipairs(Arena_Combo.moveset) do
					combo = combo..v.." "
				end
				Arena_Combo_Show = combo..")"
				Arena_Combo_Show_T = Arena_Combo_Show_Delay
				local f = Arena_Combo_Enact[cmb.name]
				if f then f() end
				local s = Sound.get("lowWhoosh")
				if s then
					s:setVolume(Logarithming(GAME_SFX_VOLUME))
					if not s:isPlaying() then
						s:play()
					end
				end
			-- else
			-- 	for i,v in ipairs(Arena_Combo.moveset) do
			-- 		combo = combo..v.." "
			-- 	end
			end
			Arena_Combo:clear()
		end
		Arena_Key = ""
	end
end

-- Draw back paralax
function Arena_BackParalax()
	local img
	img = Image.get("arena_sky")
	love.graphics.draw(img,0,0,0,1,2)

	img = Image.get("arena_far")
	love.graphics.draw(img,-0.25*Arena_Space.Xlax,-Arena_Space.Ylax,0,1,1.45)
	love.graphics.draw(img,-0.25*Arena_Space.Xlax + img:getWidth(),-Arena_Space.Ylax,0,1,1.45)

	img = Image.get("arena_near")
	love.graphics.draw(img,-0.5*Arena_Space.Xlax,-Arena_Space.Ylax,0,1,1.45)
	love.graphics.draw(img,-0.5*Arena_Space.Xlax + img:getWidth(),-Arena_Space.Ylax,0,1,1.45)
	love.graphics.draw(img,-0.5*Arena_Space.Xlax + 2*img:getWidth(),-Arena_Space.Ylax,0,1,1.45)
	
	img = Image.get("arena_lot")
	love.graphics.draw(img,-800 - Arena_Space.Xlax,-110,0,2,1)
end

-- Draw front paralax
function Arena_FrontParalax()
	local img = Image.get("arena_lamp")
	love.graphics.draw(img,-800 -1.25*Arena_Space.Xlax,-110,0,2,1)
end

-- Draw key pressed
function Arena_KeyShow()
	if not(Arena_Key == "w" or Arena_Key == "a" or Arena_Key == "s" or Arena_Key == "d") then
		Arena_Key = "n"
	end

	local img = Image.get(Arena_Key.."_wasd")
	love.graphics.draw(img,600,-150,0,0.5)
end

-- Animate player based on the state
-- A simple modulus is enough to loop the animation
-- but more work is needed for animations that have a transition
-- (Running for example)
function Arena_Animate()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	local img = Image.get("arena_player")
	local N = 1
	if A.state == PLAYER_IDLE then
		A.substate = 0
		N = A.substate + 1
		if Arena_Idle_Time >= Arena_Idle_Time_Max then
			A.state = PLAYER_IDLE_IMPATIENT
			N = 1
		end
	elseif A.state == PLAYER_IDLE_IMPATIENT then
		A.substate = A.substate + 4*DT()
		N = (math.floor(A.substate) % 11) + 1
	elseif A.state == PLAYER_RIGHT then
		A.substate = A.substate + 4*DT()
		if A.substate > 1 then
			N = (math.floor(A.substate) % 3) + 3
		else
			N = math.min(math.floor(A.substate),1) + 1
		end
	elseif A.state == PLAYER_LEFT then
		A.substate = A.substate + 4*DT()
		if A.substate > 1 then
			N = (math.floor(A.substate) % 3) + 3
		else
			N = math.min(math.floor(A.substate),1) + 1
		end
	elseif A.state == PLAYER_DOWN then
		A.substate = 0
		N = A.substate + 1
	elseif A.state == PLAYER_JUMP then
		A.substate = A.substate + 4*DT()
		N = math.min(math.floor(A.substate),2) + 1
	elseif A.state == PLAYER_FLOAT then
		A.substate = A.substate + 4*DT()
		N = (math.floor(A.substate) % 4) + 1
	elseif A.state == PLAYER_FALL then
	elseif A.state == PLAYER_SLIDE_RIGHT then
		A.substate = A.substate + 4*DT()
		N = math.min(math.floor(A.substate),1) + 1
	elseif A.state == PLAYER_SLIDE_LEFT then
		A.substate = A.substate + 4*DT()
		N = math.min(math.floor(A.substate),1) + 1
	end

	love.graphics.draw(img, Plr_Quad[A.state][N],A.x - Arena_Space.Xlax,A.y - Arena_Space.Ylax)
end

-- Draw other objects that are not the player
function Arena_Objects()
	for i,v in pairs(Arena_Space.objects) do
		if not(v.t == OBJ_TYPE_PLAYER) then
			if v.t == OBJ_TYPE_ENEMY_1 then
				v.state = v.state + 5*DT()
				local N = (math.floor(v.state) % 2) + 1
				local img = Image.get("arena_magic")
				love.graphics.draw(img, Magician_Quad[N],v.x - Arena_Space.Xlax,v.y - Arena_Space.Ylax)
			else
				love.graphics.rectangle("fill",v.x - Arena_Space.Xlax,v.y - Arena_Space.Ylax,v.w,v.h)
				if v.text then
					love.graphics.print({v.color,v.text},v.tx,v.ty)
				end
			end
		end
	end

	for i,v in pairs(Arena_Space.bounds) do
		love.graphics.rectangle("line",v.x - Arena_Space.Xlax,v.y - Arena_Space.Ylax,v.w,v.h)
	end
end

-- Things to draw when the boss is defeated
function Arena_BossEnd()
	for i,v in pairs(Arena_Space.objects) do
		if v.t == OBJ_TYPE_ENEMY_1 then
			v.state = v.state + 5*DT()
			local N = math.min(math.floor(v.state) + 1,19)
			local img = Image.get("arena_magic_anim")
			if (math.floor(v.state) + 1) >= 19 then
				local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
				if A then
					v.x = Lerp(0.001,0,1,v.x,A.x)
					v.y = Lerp(0.001,0,1,v.y,A.y)
				end
			end
			love.graphics.draw(img, Magician_Quad2[N],v.x - Arena_Space.Xlax,v.y - Arena_Space.Ylax)
		end
	end

	local img = Image.get("boss")
	love.graphics.draw(img)

	for i,v in pairs(Arena_Space.bounds) do
		love.graphics.rectangle("line",v.x - Arena_Space.Xlax,v.y - Arena_Space.Ylax,v.w,v.h)
	end
end

-- Show the players hp
function Arena_Hp_Show()
	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	if A then
		love.graphics.print(string.format("%.2f HP",A.hp),0,0,0,2)
	end
end

-- Reset Arena
LOAD[ARENA] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,0,32,32,200,100,100,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,100,OBJ_TYPE_ENEMY_1))
	Arena_Space:addWall(Wall.new(200,500,100,50))
	Arena_Space:addWall(Wall.new(500,300,100,50))
	INTRO_PLAYED = false
	Arena_Combo_Show = ""
	Arena_Combo_Show_T = 0
	Arena_Idle_Time = 0
	Arena_Dead = 0

	local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
	A.hp = 100

	-- Play Intro
	local intro = Sound.get("arenaIntro")
	if intro then
		intro:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not intro:isPlaying() and not INTRO_PLAYED then
			intro:play()
		end
	end
end

-- Arena update
UPDATE[ARENA] = function(dt)
	-- if the player is not dead
	if Arena_Dead <= 0 then
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
		if Arena_Ending <= 0 then
			for i,v in pairs(Arena_Space.objects) do
				if not(v.t == OBJ_TYPE_PLAYER) then
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

			-- if player hp is less than 0 they die
			local A = Arena_Space:findFirst(OBJ_TYPE_PLAYER)
			if A then
				if A.hp <= 0 then
					Arena_Dead = 3
				end
			end

			-- if the boss hp is less than 0 the player wins
			local E = Arena_Space:findFirst(OBJ_TYPE_ENEMY_1)
			if E then
				E:update(Arena_Space)
				if E.hp <= 0 then
					Arena_Ending = 10
				end
			end
		end
	else
		-- freeze the game and count the death timer
		Arena_Dead = Arena_Dead - dt
		if Arena_Dead <= 0 then
			-- when finished, load the arena again
			LOAD[ARENA]()
		end
	end
end

KEYPRESSED[ARENA] = function(key)
	if key == "escape" then
		local song = Sound.get("arena")
		local intro = Sound.get("arenaIntro")
		if song then
			song:pause()
		end

		if intro then
			intro:pause()
		end
		PauseState()
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

MOUSEPRESSED[ARENA] = function(x,y,button)
	
end

DRAW[ARENA] = function()
	-- if player not dead
	if Arena_Dead <= 0 then
		local song = Sound.get("arena")
		local intro = Sound.get("arenaIntro")

		if song and intro then
			song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
			if not song:isPlaying() and not intro:isPlaying() then
				song:play()
			end
		end

		-- draw background
		Arena_BackParalax()
		Arena_Animate()

		-- if boss alive
		if Arena_Ending <= 0 then
			Arena_Objects()
		else
			-- show ending
			Arena_BossEnd()
			Arena_Ending = Arena_Ending - DT()
			if Arena_Ending <= 0 then
				-- Next Day
				if song then
					song:stop()
				end
				if intro then
					intro:stop()
				end

				if (READINGS_DAY + 1) <= 4 then
					Switch_State(READINGS)
				else
					if (READINGS_DAY + 1) == 5 then
						READINGS_DAY = (READINGS_DAY + 1)
						Switch_State(ENDING)
					else
						GoToArena() -- Endless boss fight
					end
				end
			end
		end
		
		Arena_FrontParalax()

		-- show player info
		Arena_KeyShow()
		if Arena_Combo_Show_T >= 0 then
			love.graphics.print(Arena_Combo_Show,0,30,0,2)
			Arena_Combo_Show_T = Arena_Combo_Show_T - DT()
		end

		Arena_Hp_Show()
	else
		-- stop music
		local song = Sound.get("arena")
		local intro = Sound.get("arenaIntro")
		if song then
			song:stop()
		end
		if intro then
			intro:stop()
		end

		-- draw background
		Arena_BackParalax()
		Arena_Objects()
		Arena_FrontParalax()
		
		-- gray overlay
		love.graphics.setColor(0.5,0.5,0.5,0.5)
		love.graphics.rectangle("fill",0,0,800,600)
		love.graphics.setColor(1,1,1)
	end
end
