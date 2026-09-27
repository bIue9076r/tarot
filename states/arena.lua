require("arena/space")
require("arena/combo")
ARENA = 4

Arena_Space = Space.new()

Arena_Max_Velocity_X = 100
Arena_Max_Velocity_Y = 400

Arena_Combo = Combo.new()
Empty_Combo = Combo.new()
Arena_Combo_Delay = 0.5
Arena_Combo_Show = ""
Arena_Combo_Show_T = 0
Arena_Combo_Show_Delay = 2

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

Arena_Idle_Time = 0

Arena_Combo_List = ComboList.new({
	{name = "Ground Circle", cmb = Combo.new({"d","w","a","s"})},
	{name = "Aireal Circle", cmb = Combo.new({"w","d","w","a","s"})},
	{name = "Down Wall", cmb = Combo.new({"w","s"})},
	{name = "Up Wall", cmb = Combo.new({"s","w"})},
	{name = "Up Wave Right", cmb = Combo.new({"d","s","w"})},
	{name = "Up Wave Left", cmb = Combo.new({"a","s","w"})},
	{name = "Down Wave Right", cmb = Combo.new({"d","w","s"})},
	{name = "Down Wave Left", cmb = Combo.new({"a","w","s"})},
})

function Sign(n)
	if n > 0 then
		return 1
	elseif n < 0 then
		return -1
	end

	return 0
end

function Lerp(t,a,b,c,d)
	-- (a,b) to (c,d)
	a = a or 0
	b = b or 0
	c = c or 1
	d = d or 0

	if(a - c == 0) then
		return 0
	end

	local m = (d - b)/(c - a)
	return m*(t - a) + c
end

function Arena_Collision(A)
	A = A or Arena_Space:findFirst(1)
	local nx = A.nx
	local ny = A.ny

	for i = 1,3 do
		if (not Arena_Space:PreCollide(A)) or (not Arena_Space:PreCollideWall(A)) then
			break
		end
		A.nx = Lerp(i/3,0,1,nx,A.x)
		A.ny = Lerp(i/3,0,1,ny,A.y)
	end
end

function Arena_Move_Up()
	local A = Arena_Space:findFirst(1)
	if A then
		A:AUp(Arena_Space.G);
		A.state = PLAYER_JUMP
		if A.falling then
			return false
		end

		return true
	end
end

function Arena_Move_Down()
	local A = Arena_Space:findFirst(1)
	if A then A:ADown(); A.state = PLAYER_DOWN end
end

function Arena_Move_Left()
	local A = Arena_Space:findFirst(1)
	if A then A:ALeft(); A.state = PLAYER_LEFT end
	return true
end

function Arena_Move_Right()
	local A = Arena_Space:findFirst(1)
	if A then A:ARight(); A.state = PLAYER_RIGHT end
	return true
end

function Arena_Position()
	local A = Arena_Space:findFirst(1)
	if A then A:PrePosition() end
	Arena_Collision(A)
	A:Position()
	Arena_Space.Xlax = math.max(A.x - 200,0)
	-- Arena_Space.Ylax = math.max(A.y - 200,0)
end

function Arena_Move_None_X()
	local A = Arena_Space:findFirst(1)
	if A then
		A:ANoneX()
		if (A.vy == 0) and (A.vx == 0) then
			A.state = PLAYER_IDLE
		else
			if A.vy == 0 then
				if A.x > 0 then
					A.state = PLAYER_SLIDE_RIGHT
				else
					A.state = PLAYER_SLIDE_LEFT
				end
			else
				if A.vy > 0 then
					A.state = PLAYER_FLOAT
				else
					A.state = PLAYER_FALL
				end
			end
		end
	end
end

function Arena_Move_None_Y()
	local A = Arena_Space:findFirst(1)
	if A then
		if Arena_Space:CollideWall(A) then
			A.falling = false
		else
			A.falling = true
		end
		
		A:ANoneY(Arena_Space.G)
		if (A.vy == 0) and (A.vx == 0) then
			A.state = PLAYER_IDLE
		else
			if A.vy == 0 then
				if A.x > 0 then
					A.state = PLAYER_SLIDE_RIGHT
				else
					A.state = PLAYER_SLIDE_LEFT
				end
			else
				if A.vy > 0 then
					A.state = PLAYER_FLOAT
				else
					A.state = PLAYER_FALL
				end
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
				combo = combo..cmb.name
			else
				for i,v in ipairs(Arena_Combo.moveset) do
					-- combo = combo..v.." "
				end
			end
			Arena_Combo_Show = combo
			Arena_Combo_Show_T = Arena_Combo_Show_Delay
			Arena_Combo:clear()
		end
	end
end

LOAD[ARENA] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(0,20,32,32,200,100,100,1))
	Arena_Space:addWall(Wall.new(0,550,800,50))

	local A = Arena_Space:findFirst(1)
end

UPDATE[ARENA] = function(dt)
	local moved = {x=false,y=false}
	if love.keyboard.isDown("a") then
		moved.x = Arena_Move_Left()
	elseif love.keyboard.isDown("d") then
		moved.x = Arena_Move_Right()
	end
	if love.keyboard.isDown("w") then
		moved.y = Arena_Move_Up()
	end
	if not moved.x then
		Arena_Move_None_X()
	end
	if not moved.y then
		Arena_Move_None_Y()
	end
	Arena_Position()
	Arena_Move_Combo()
end

KEYPRESSED[ARENA] = function(key)
	Arena_Combo:addMove(key)
end

MOUSEPRESSED[ARENA] = function(x,y,button)
	
end

DRAW[ARENA] = function()
	local song = Sound.get("arena")
	if song then
		song:setVolume(Logarithming(GAME_MUSIC_VOLUME))
		if not song:isPlaying() then
			song:play()
		end
	end

	local A = Arena_Space:findFirst(1)
	love.graphics.rectangle("fill",A.x - Arena_Space.Xlax,A.y - Arena_Space.Ylax,A.w,A.h)
	love.graphics.print("VX:"..A.vx.." VY:"..A.vy.." X:"..A.x.." Y:"..A.y)
	A = Arena_Space.bounds[1]
	love.graphics.rectangle("line",A.x - Arena_Space.Xlax,A.y - Arena_Space.Ylax,A.w,A.h)

	if Arena_Combo_Show_T >= 0 then
		love.graphics.print(Arena_Combo_Show,0,30,0,2)
		Arena_Combo_Show_T = Arena_Combo_Show_T - DT()
	end
end
