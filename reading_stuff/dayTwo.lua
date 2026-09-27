require("reading_stuff.int2")
DAY_TWO = 2
Current_C = 1
Current_T = 0
--Current_TBL = {}

Is_Intro = true
Is_Intro2 = false
Is_CardPick = false
Is_Response = false
Is_Fade = false

Fade_t = 0

READINGS_LOAD[DAY_TWO] = function()
    Customer_List2 = {Characters[17], Characters[7], Characters[14]}
    Cust2 = {}
    Cust2[1] = {TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()]}
    Cust2[2] = {TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()]}
    Cust2[3] = {TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()]}
    --Cust[4] = {TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()], TAROTCARDS[RandomCard()]}

end

READINGS_UPDATE[DAY_TWO] = function(dt)
    if Current_C > 3 then
        --GoToArena()
        NextDay()
    end
    SetTable2()
	SetResponse2()
end

READINGS_KEYPRESSED[DAY_TWO] = function(key)
    if Is_Intro or Is_Intro2 then
       if key == "space" then
            Current_I = Current_I + 1
            if Current_I > #Current_TBL then
                Current_I = #Current_TBL
            end
        end
    elseif Is_CardPick then
        CheckCard2(key)
    elseif Is_Response then
        if key == "space" then
            Current_I = Current_I + 1
            if Current_I > #Current_TBL then
                Current_I = #Current_TBL
            end
        end
        if key == "return" then
            Is_Response = false
            Is_Fade = true
            Customer_List2[Current_C].yap = false
            Customer_List2[Current_C]:animate()
        end
    end
end

READINGS_MOUSEPRESSED[DAY_TWO] = function(x,y,button)
    if Is_Intro then
        if Current_I == #Current_TBL then
            if CheckBall(x,y,button) then
                Is_Intro = false
                Is_Intro2 = true
                Current_I = 1
            end
        end
    elseif Is_Intro2 then
        if Current_I == #Current_TBL then
            if CheckBall(x,y,button) then
                Is_Intro2 = false
                Is_CardPick = true
                Current_I = 1
            end
        end
    end
end

READINGS_DRAW[DAY_TWO] = function()
    if Is_Intro then
        print(Customer_List2, Current_C)
        Customer_List2[Current_C].yap = true
        if not (Getspeaker(Current_TBL) == SPEAKER_CHARACTER) then
           Customer_List2[Current_C].yap = false
        end
        Customer_List2[Current_C]:animate()
        PrintIntros(Current_TBL)

    elseif Is_Intro2 then
        Customer_List2[Current_C].yap = true
        if not (Getspeaker(Current_TBL) == SPEAKER_CHARACTER) then
           Customer_List2[Current_C].yap = false
        end
        Customer_List2[Current_C]:animate()
        PrintIntros(Current_TBL)

    elseif Is_CardPick then
        Customer_List2[Current_C].yap = true
        if not (Getspeaker(Current_TBL) == SPEAKER_CHARACTER) then
           Customer_List2[Current_C].yap = false
        end
        Customer_List2[Current_C]:animate()
        for i = 1,4 do
            Current_T = Current_T + 0.6*DT()
            Tarot_Cards:draw(i,Cust2[Current_C],math.min(Current_T,1))
        end

    elseif Is_Response then
        Customer_List2[Current_C].yap = true
        if not (Getspeaker(Current_TBL) == SPEAKER_CHARACTER) then
           Customer_List2[Current_C].yap = false
        end
        Customer_List2[Current_C]:animate()
        DrawResponse2()
    elseif Is_Fade then
        Fade_t = Fade_t + 3.5*DT()
        local t = math.min(Fade_t,1)
        love.graphics.setColor(0,0,0,(0.5*(1 - t) - 1)*(0.5*(1 - t) - 1))
        love.graphics.rectangle("fill",0,0,800,600)
        Customer_List2[Current_C]:animate()
        love.graphics.setColor(1,1,1)
        if Fade_t >= 10 then
            Current_C = Current_C + 1
            Is_Fade = false
            Is_Intro = true
            Current_I = 1
            PICK = 0
            Current_T = 0
            Fade_t = 0
        end
    end
end