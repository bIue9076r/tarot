ARENA_LOAD[1] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
end

ARENA_LOAD[2] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	for i = 1,5 do
		local t = 270 + 20*((i*i % 7) % 4)
		Arena_Space:add(Enemy.new(Lerp(i,1,5,300,2600),t,32,32,25,OBJ_TYPE_ENEMY_2))
	end
end

ARENA_LOAD[3] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))

	for i = 1,15 do
		local t = 270 + 20*((i*i % 7) % 4)
		Arena_Space:add(Enemy.new(Lerp(i,1,15,300,2600),t,32,32,25,OBJ_TYPE_ENEMY_2,true))
	end
end

ARENA_LOAD[4] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	Arena_Space:add(Enemy.new(2000,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	Arena_Space:add(Enemy.new(1000,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
end

ARENA_LOAD[5] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	Arena_Space:add(Enemy.new(2000,50,80,170,150,OBJ_TYPE_ENEMY_1,true))

	for i = 1,7 do
		local t = 270 + 20*((i*i % 7) % 4)
		Arena_Space:add(Enemy.new(Lerp(i,1,7,300,2600),t,32,32,25,OBJ_TYPE_ENEMY_2))
	end
end

ARENA_LOAD[6] = function()
	Arena_Space = Space.new()
	Arena_Space:add(Object.new(50,500,32,32,200,100,200,OBJ_TYPE_PLAYER))
	Arena_Space:addWall(Wall.new(0,550,3200,50))
	Arena_Space:addWall(Wall.new(0,-50,3200,50))
	Arena_Space:addWall(Wall.new(-50,-100,50,900))
	Arena_Space:addWall(Wall.new(3200,-100,50,900))
	Arena_Space:add(Enemy.new(250,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	Arena_Space:add(Enemy.new(2000,50,80,170,150,OBJ_TYPE_ENEMY_1,true))
	Arena_Space:add(Enemy.new(1000,50,80,170,150,OBJ_TYPE_ENEMY_1,true))

	for i = 1,15 do
		local t = 270 + 20*((i*i % 7) % 4)
		Arena_Space:add(Enemy.new(Lerp(i,1,15,300,2600),t,32,32,25,OBJ_TYPE_ENEMY_2))
	end
end
