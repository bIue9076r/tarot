Enemy = {}

OBJ_TYPE_ENEMY_1 = 4 -- Magician
-- OBJ_TYPE_ENEMY_2 = 5
-- OBJ_TYPE_ENEMY_3 = 6

function Enemy.new(x,y,w,h,hp,t)
	local tbl = Object.new(x,y,w,h,nil,nil,hp,t,true,false)

	tbl.target_time = 5
	tbl.target_t = 5
	tbl.tx = 0
	tbl.ty = 0
	tbl.Position = Enemy.Position
	tbl.update = Enemy.update
	return tbl
end

function Enemy:Position()
	local dt = DT()
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt
end

function Enemy:update(space)
	local dt = DT()
	local A = space:findFirst(OBJ_TYPE_PLAYER)
	if self.t == OBJ_TYPE_ENEMY_1 then
		if A then
			if self.target_t <= 0 then
				self.tx = A.x
				self.ty = 50
				self.target_t = self.target_time
				local Dy = A.y - self.y
				local Dx = A.x - self.x
				local D = math.acos(Dx/math.sqrt(Dy^2 + Dx^2))

				space:add(Projectile.foe(25,self.x,self.y,5,5,D,400))
				space:add(Projectile.foe(25,self.x,self.y,5,5,D * 0.9,400))
				space:add(Projectile.foe(25,self.x,self.y,5,5,D * 1.1,400))
				space:add(Projectile.foe(25,self.x,self.y,5,5,D * 0.8,400))
				space:add(Projectile.foe(25,self.x,self.y,5,5,D * 1.2,400))
			end
			self.target_t = self.target_t - dt

			if self.tx > self.x then
				self.vx = 100
			elseif self.tx < self.x then
				self.vx = -100
			end
		end
	end
end