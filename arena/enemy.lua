Enemy = {}

OBJ_TYPE_ENEMY_1 = 4 -- Magician
OBJ_TYPE_ENEMY_2 = 5
OBJ_TYPE_ENEMY_3 = 6

function Enemy.new(x,y,w,h,hp,t,i)
	local tbl = Object.new(x,y,w,h,nil,nil,hp,t,true,false)

	tbl.target_time = 5
	tbl.target_t = 5
	tbl.osc_t = 0
	tbl.attack_time = 0.75
	tbl.attack_t = 0.75
	tbl.tx = 0
	tbl.ty = 0
	tbl.direction = false
	tbl.important = i
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
				if self.hp < 60 then
					self.tx = Lerp(A.x,1,2600,2600,1)
					if math.abs(self.x - A.x) < 100 then
						self.tx = math.random(1,2600)
					end
				else
					self.tx = math.max(1,math.min(A.x + 100*math.random() - 50,2600))
				end
				self.ty = 50
				self.target_t = self.target_time - math.random()
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
				self.vx = math.min(self.vx + 75*dt,100)
			elseif self.tx < self.x then
				self.vx = math.max(self.vx - 75*dt,-100)
			end
		end
	elseif self.t == OBJ_TYPE_ENEMY_2 then
		self.target_time = 0.25
		self.osc_t = self.osc_t + 2*dt*math.random()
		if A then
			if math.abs(self.x - A.x) < 50 and math.abs(self.y - A.y) < 50 then
				self.attack_t = self.attack_t - dt
				self.state = 4
				if self.attack_t <= 0 then
					self.attack_t = self.attack_time
					A.hp = A.hp - 25
				end
			else
				self.attack_t = self.attack_time
				self.state = (math.floor(self.osc_t) % 2) + 2
			end

			if self.target_t <= 0 then
				self.target_t = self.target_time - 0.1*math.random()
				if math.abs(self.x - A.x) <= 200 then
					self.tx = A.x
				else
					self.tx = math.random(1,2600)
				end
			end
			self.target_t = self.target_t - dt

			if self.tx > self.x then
				self.vx = math.min(self.vx + 100*dt,100)
			elseif self.tx < self.x then
				self.vx = math.max(self.vx - 100*dt,-100)
			end

			if Sign(self.vx) >= 0 then
				self.direction = false
			else
				self.direction = true
			end

			self.vy = 100*math.sin(self.osc_t)
		end
	elseif self.t == OBJ_TYPE_ENEMY_3 then

	end
end