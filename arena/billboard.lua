Billboard = {}
OBJ_TYPE_BILLBOARD = 10

function Billboard.new(str,x,y,c,s)
	str = str or ""
	x = x or 0
	y = y or 0
	c = c or {0,0,0}
	s = s or 1
	local tbl = Object.new(0,0,0,0,0,0,1,OBJ_TYPE_BILLBOARD,false,false)
	tbl.text = str
	tbl.tx = x
	tbl.ty = y
	tbl.color = c
	tbl.scale = s

	return tbl
end
