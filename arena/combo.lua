Combo = {
	moveset = {},
	fresh = 0,
}

function Combo.new(moveset)
	if not(type(moveset) == "table") then
		moveset = {}
	end

	local tbl = {
		moveset = moveset,
	}

	local mt = {
		__index = Combo
	}

	return setmetatable(tbl,mt)
end

function Combo:addMove(move)
	move = move or "w"
	self.fresh = 0
	table.insert(self.moveset,move)
end

function Combo:compare(cmb)
	for i,v in ipairs(self.moveset) do
		if not (v == cmb.moveset[i]) then
			return false
		end
	end
	return true
end

function Combo:clear()
	self.moveset = {}
end


ComboList = {
	combos = {},
	allowed = {"w","a","s","d"},
}

function ComboList.new(list, valid)
	if not(type(list) == "table") then
		list = {}
	end

	if not(type(valid) == "table") then
		valid = {"w","a","s","d"}
	end

	local tbl = {
		combos = list,
		allowed = valid,
	}

	local mt = {
		__index = ComboList
	}

	return setmetatable(tbl,mt)
end

function ComboList:validate(cmb)
	if cmb and cmb.moveset then
		for i,v in pairs(cmb.moveset) do
			local valid = false
			for j,k in ipairs(self.allowed) do
				if v == k then
					valid = true
				end
			end

			if not valid then
				cmb.moveset[i] = nil
				for I = i,#cmb.moveset do
					cmb.moveset[I] = cmb.moveset[I + 1]
					cmb.moveset[I + 1] = nil
				end
			end
		end
	end
end

function ComboList:addCombo(name,cmb)
	if type(cmb) == "table" then
		self:validate(cmb)
		table.insert(self.combos,{name = name or "Empty", cmb = cmb})
	else
		table.insert(self.combos,{name = name or "Empty", cmb = Combo.new()})
	end
end

function ComboList:compare(cmb)
	for i,v in ipairs(self.combos) do
		if v.cmb:compare(cmb) then
			return v
		end
	end
end
