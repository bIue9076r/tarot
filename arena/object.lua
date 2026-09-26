Object = {
	x = 0, y = 0,
	nx = 0, ny = 0,
	vx = 0, vy = 0,
	ax = 100, ay = 100,
	w = 32, h = 32,
	t = 0,
	hp = 100,
	state = 0,
	substate = 0,
	c = true, g = true,
	falling = true,
	my = 400, mx = 100,
}

function Object.new(x,y,w,h,ax,ay,hp,t,c,g)
	local tbl = {
		x = x or 0, y = y or 0,
		nx = 0, ny = 0,
		vx = 0, vy = 0,
		ax = ax or 100, ay = ay or 100,
		w = w or 32, h = h or 32,
		hp = hp or 100,
		t = t or 0,
		state = 0,
		substate = 0,
		c = c or true, g = g or true,
		falling = true,
		my = 400, mx = 100,
	}

	local mt = {
		__index = Object
	}

	return setmetatable(tbl,mt)
end

function Object:AUp(G)
	local dt = DT()
	if not self.g then
		self.vy = math.max(self.vy - (self.ay * dt),-self.my)
	else
		if not self.falling then
			if G then
				self.vy = math.max(self.vy - (5 * G * dt),-self.my)
			else
				self.vy = math.max(self.vy - (self.ay * dt),-self.my)
			end
		end

		if self.vy <= -self.my then
			self.falling = true
		end
	end
end

function Object:ADown()
	local dt = DT()
	if not self.g then
		self.vy = math.min(self.vy + (self.ay * dt),self.my)
	end
end

function Object:ALeft()
	local dt = DT()
	self.vx = math.max(self.vx - (self.ax * dt),-self.mx)
end

function Object:ARight()
	local dt = DT()
	self.vx = math.min(self.vx + (self.ax * dt),self.mx)
end

function Object:ANoneX()
	local dt = DT()
	self.vx = Sign(self.vx)*math.max(math.abs(self.vx) - (self.ax * 1.5 * dt),0)
end

function Object:ANoneY(G)
	local dt = DT()
	if not self.g then
		self.vy = Sign(self.vy)*math.max(math.abs(self.vy) - (self.ay * 1.5 * dt),0)
	else
		if G and self.falling then
			self.vy = math.min(self.vy + (G * dt),self.my)
		else
			self.vy = 0
		end
	end
end

function Object:ANone(G)
	Object:ANoneX()
	Object:ANoneY(G)
end

function Object:PrePosition()
	local dt = DT()
	self.nx = self.x + self.vx * dt
	self.ny = self.y + self.vy * dt
end

function Object:Position()
	self.x = self.nx
	self.y = self.ny
end

function Object:SetMaxVX(vx)
	self.mx = vx or 100
end

function Object:SetMaxVY(vy)
	self.my = vy or 100
end

function Object:Collide(obj)
	return	(self.x < obj.x + obj.w) and (self.x + self.w > obj.x) and
			(self.y < obj.y + obj.h) and (self.y + self.h > obj.y)
end

function Object:PreCollide(obj)
	return	(self.nx < obj.x + obj.w) and (self.nx + self.w > obj.x) and
			(self.ny < obj.y + obj.h) and (self.ny + self.h > obj.y)
end

Wall = {x = 0, y = 0, w = 0, h = 0}

function Wall.new(x,y,w,h)
	local tbl = {
		x = x or 0, y = y or 0,
		w = w or 0, h = h or 0,
	}

	local mt = {
		__index = Wall,
	}

	return setmetatable(tbl,mt)
end

function Wall:Collide(obj)
	return	(self.x < obj.x + obj.w) and (self.x + self.w > obj.x) and
			(self.y < obj.y + obj.h) and (self.y + self.h > obj.y)
end

function Wall:TopCollide(obj)
	return	(self.x < obj.x + obj.w) and (self.x + self.w > obj.x) and
			(self.y < obj.y + obj.h)
end
