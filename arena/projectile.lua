Projectile = {}
OBJ_TYPE_PROJECTILE_FOE = 2
OBJ_TYPE_PROJECTILE_JOE = 3

function Projectile.new(dam,x,y,w,h,dir,vd)
	return Projectile.foe(dam,x,y,w,h,dir,vd)
end

function Projectile.foe(dam,x,y,w,h,dir,vd)
	dir = dir or 0
	vd = vd or 0
	local vx = vd * math.cos(dir)
	local vy = vd * math.sin(dir)
	local tbl = Object.new(x,y,w,h,nil,nil,dam,OBJ_TYPE_PROJECTILE_FOE,true,false)
	tbl.vx = vx
	tbl.vy = vy

	tbl.Position = Projectile.Position
	return tbl
end

function Projectile.joe(dam,x,y,w,h,dir,vd)
	dir = dir or 0
	vd = vd or 0
	local vx = vd * math.cos(dir)
	local vy = vd * math.sin(dir)
	local tbl = Object.new(x,y,w,h,nil,nil,dam,OBJ_TYPE_PROJECTILE_JOE,true,false)
	tbl.vx = vx
	tbl.vy = vy

	tbl.Position = Projectile.Position
	return tbl
end

function Projectile:Position()
	local dt = DT()
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt
end
