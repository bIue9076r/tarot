TITLE = 1

LOAD[TITLE] = function()

end

UPDATE[TITLE] = function(dt)

end

-- Buttons
New_Game_But = Button.new(150,400,50,30)
Load_Save_But = Button.new(350,400,50,30)
Setting_But = Button.new(550,400,50,30)

KEYPRESSED[TITLE] = function(key)

end

MOUSEPRESSED[TITLE] = function(x,y,button)
    if New_Game_But:click(x,y,button) then
        GAME_STATE = 2
    end
    if Load_Save_But:click(x,y,button) then
        print("load save")
    end
    if Setting_But:click(x,y,button) then
        print("settings")
        
    end

end

DRAW[TITLE] = function()
    New_Game_But:draw()
    Load_Save_But:draw()
    Setting_But:draw()

    love.graphics.setBackgroundColor(0,1,1)
	love.graphics.setColor(1,1,1)

end
