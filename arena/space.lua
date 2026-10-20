require("arena/object")
require("arena/projectile")
require("arena/enemy")
require("arena/billboard")

Space = {
	G = 980,
	Xlax = 0,
	Ylax = 0,
	objects = {},
	bounds = {},
}

function Space.new(objs,walls)
	local tbl = {
		objects = objs or {},
		bounds = walls or {},
	}

	local mt = {
		__index = Space,
	}

	return setmetatable(tbl,mt)
end

function Space:add(obj)
	table.insert(self.objects,obj)
end

function Space:addWall(wall)
	table.insert(self.bounds,wall)
end

function Space:findFirst(type)
	for i,v in pairs(self.objects) do
		if v.t == type then
			return v
		end
	end
end

function Space:find(type)
	local R = {}
	for i,v in pairs(self.objects) do
		if v.t == type then
			table.insert(R,v)
		end
	end

	if not(#R == 0) then
		return R
	end
	return nil
end

function Space:findType(types)
	local R = {}

	for i,v in pairs(self.objects) do
		for j,k in pairs(types) do
			if v.t == k then
				table.insert(R,v)
				break
			end
		end
	end

	if not(#R == 0) then
		return R
	end
	return nil
end

function Space:remove(obj)
	for i,v in pairs(self.objects) do
		if (obj == v) then
			self.objects[i] = nil
			for I = i + 1,#self.objects do
				self.objects[I - 1] = self.objects[I]
				self.objects[I] = nil
			end
		end
	end
end

function Space:Collide(obj)
	for i,v in pairs(self.objects) do
		if not(v == obj) then
			if v.c then
				local c = obj:Collide(v)
				if c then return v end
			end
		end
	end
end

function Space:PreCollide(obj)
	for i,v in pairs(self.objects) do
		if not(v == obj) then
			if v.c then
				local c = obj:PreCollide(v)
				if c then return v end
			end
		end
	end
end

function Space:CollideWall(obj)
	for i,v in pairs(self.bounds) do
		local c = obj:Collide(v)
		if c then return v end
	end
end

function Space:PreCollideWall(obj)
	for i,v in pairs(self.bounds) do
		local c = obj:PreCollide(v)
		if c then return v end
	end
end

function Space:PreCollideWallT(obj)
	local tbl = {}
	for i,v in pairs(self.bounds) do
		local c = obj:PreCollide(v)
		if c then table.insert(tbl,v) end
	end
	
	if #tbl > 0 then
		return tbl
	end
	return nil
end

function Space:CollideWallOff(obj,ox,oy)
	local tbl = {}
	ox = ox or 0
	oy = oy or 0
	for i,v in pairs(self.bounds) do
		local c = obj:CollideOff(v,ox,oy)
		if c then table.insert(tbl,v) end
	end
	
	if #tbl > 0 then
		return tbl
	end
	return nil
end

function Space:PreSideCollide(obj)
	for i,v in pairs(self.bounds) do
		local c = v:PreSideCollide(obj)
		if c then return v end
	end
end

function Space:TopCollide(obj)
	for i,v in pairs(self.bounds) do
		local c = v:TopCollide(obj)
		if c then return v end
	end
end
