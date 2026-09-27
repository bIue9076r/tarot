require("reading_stuff.interactions")
DAY_ONE = 1
Current_C = 1
Current_TBL = {}

Is_Intro = true
Is_Intro2 = false
Is_CardPick = false

READINGS_LOAD[DAY_ONE] = function()
    Customer_List1 = {Characters[5], Characters[RandomCustomer()], Characters[RandomCustomer()], Characters[RandomCustomer()]}
    if Is_Intro then
        Current_TBL = IntroHierophant
    end
end

READINGS_UPDATE[DAY_ONE] = function(dt)
	
end

READINGS_KEYPRESSED[DAY_ONE] = function(key)
    if Is_Intro or Is_Intro2 then
       if key == "space" then
            Current_I = Current_I + 1
            if Current_I > #Current_TBL then
                Current_I = #Current_TBL
            end
        end
    end
end

READINGS_MOUSEPRESSED[DAY_ONE] = function(x,y,button)
    if Is_Intro then
        if Current_I == #Current_TBL then
            CheckBall(x,y,button)
        end
    end
	
end

READINGS_DRAW[DAY_ONE] = function()
    if Is_Intro then
        Customer_List1[Current_C].yap = true
        if not (Getspeaker(IntroHierophant) == SPEAKER_CHARACTER) then
           Customer_List1[Current_C].yap = false
        end
    Customer_List1[Current_C]:animate()
    PrintIntros(IntroHierophant)
    elseif Is_Intro2 then
        Customer_List1[Current_C].yap = true
        if not (Getspeaker(Intro2Hierophant) == SPEAKER_CHARACTER) then
           Customer_List1[Current_C].yap = false
        end
        Customer_List1[Current_C]:animate()
        PrintIntros(Intro2Hierophant)
    elseif Is_CardPick then
    end
end