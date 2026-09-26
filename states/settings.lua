SETTINGS = 8

-- Buttons
Exit_But = Button.new(580,450,150,100)

Volume_Up = Button.new(50,100,50,50)
Volume_Down = Button.new(125,100,50,50)

Music_Volume_Up = Button.new(50,200,50,50)
Music_Volume_Down = Button.new(125,200,50,50)

Sfx_Volume_Up = Button.new(50,300,50,50)
Sfx_Volume_Down = Button.new(125,300,50,50)

LOAD[SETTINGS] = function()

end

UPDATE[SETTINGS] = function(dt)

end

KEYPRESSED[SETTINGS] = function(key)

end

MOUSEPRESSED[SETTINGS] = function(x,y,button)
    if Exit_But:click(x,y,button) then
        Switch_State(TITLE)
    end
	print(x,y)
end

DRAW[SETTINGS] = function()
    Exit_But:draw()
	Volume_Up:draw()
	Volume_Down:draw()
	Music_Volume_Up:draw()
	Music_Volume_Down:draw()
	Sfx_Volume_Up:draw()
	Sfx_Volume_Down:draw()

    love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(1,1,1)
	local x,y = love.mouse.getPosition()
	love.graphics.print("Main Volume "..string.format("%.1f",M),x,y)
end
