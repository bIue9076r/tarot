Sign = {}
OBJ_TYPE_SIGN = 10

function Sign.new(x,y,w,h,str,sx,sy,sc)
	str = str or ""
	sx = sx or 0
	sy = sy or 0
	sc = sc or {0,0,0}
	local tbl = Object.new(x,y,w,h,0,0,1,OBJ_TYPE_SIGN,false,false)
	tbl.text = str
	tbl.tx = sx
	tbl.ty = sy
	tbl.color = sc

	return tbl
end
