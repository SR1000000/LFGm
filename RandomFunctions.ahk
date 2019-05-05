Swap(Byref x, Byref y)
{
	t := x
	x := y
	y := t
	return
}

CSend(v := "a", a := 500, b := 1000) {
	global CSTitle
	RandSleep(a,b)

	BlockInput On
	ControlSend,, %v%, %CSTitle%
	BlockInput Off

	LookForClickClose(0.7)
}

DoThisUntilThat(thisF,thatF,thatParam1,thatParam2 := "", thisParam1 := "", thisParam2 := "")
{
	i := 0, t := ""
	
	if(!IsFunc(thisF) or !IsFunc(thatF))
	{
		MsgBox Error, invalid function names passed to DTUT, %this% %that%
		Exit
	}
	loop
	{
		GuiControl,, StatA, Doing %thisF% %thisParam1% %thisParam2% until %thatF% %thatParam1% %thatParam2%
		if(thisParam1)
			if(thisParam2)
				%thisF%(thisParam1,thisParam2)	
			else
				%thisF%(thisParam1)
		else
			%thisF%()
		
		if(thatParam2)
			t := %thatF%(thatParam1,thatParam2)
		else
			t := %thatF%(thatParam1)

		if(t)
			break
		i++
		if(i > 200)
		{
			MsgBox Error, Stuck in DTUT doing %this%, waiting for %that%. Exit
			Exit
		}
	}
	GuiControl,, StatA, %thisF% Done Until %thatF%, continuing
	return
}

NormalRand(x,y,int=1) 
{ 	;x lower y upper int for integer return
	;NormalRand(0,10) ;random integer between 0 and 10
	;NormalRand(5,20,0) ;random float between 5 and 20
	Loop 12
	{
		 Random, var,0.0,1
		 Num+=var
	}
	norm := (int) ? Round((y+x)/2+((Num-6)*(y-x))/6) : (y+x)/2+((Num-6)*(y-x))/6
	Return norm < x ? x : norm > y ? y : norm
}

RandSleep(a,b := 0) 
{
	if(!b)
		b := a
	Random, var, a, b
	Sleep %var%
	return
}


RandCircle(ByRef pointx, ByRef pointy, radius)
{
	OutX := NormalRand(-1,1,0)
	Sign := NormalRand(-1,1,0)
	pointy := Round((sqrt(1 - OutX ** 2) * radius * Sign) + pointy)
	pointx := Round((OutX * radius) + pointx)
	;pointx := OutX
	;pointy := OutY
}

RandRect(ByRef pointx, ByRef pointy, xlength, ylength) 
{
	OutX := NormalRand(-1,1,0)
	Sign := NormalRand(-1,1,0)
	pointy := Round((OutX * ylength) + pointy)
	pointx := Round((Sign * xlength) + pointx)
	;pointx := OutX
	;pointy := OutY
}

RandVisitReturn()
{
	global ecc, Home, DormB, RetHome, RetHomerx, RetHomery
	static hardNum
	QuestB := [368, 602], RankB := [626, 604], FriendsB := [714, 604]
	RankChk := [190, 520, 0x339922], FriendsB2 := [60, 188, 0xF5A200]
	Brx := 33, BRy := 11
	j := Abs(NormalRand(-2,2)) + 1
	i := 1
	if(PixelNot(Home))
	{
		MsgBox RandVisitReturn expected Home, not found
		Exit
	}
	loop
	{
		if(j>1)
			Random, n, 1, 4
		else
			Random, n, 1, 15
		if(n==1)	
		{	;Quest button
			hardNum := 0
			RCtrlClick(QuestB,Brx,Bry)
			RandSleep(3311,6932)
			WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
		} else if(n==2)
		{	;Friends List, Add Friend
			hardNum := 0
			RCtrlClick(FriendsB,Brx,Bry)
			ClickUntilPixelColor(FriendsB2,,FriendsB2,45,18)
			RandSleep(1311,4932)
			WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
		} else if(n==3)
		{	;Dorm
			hardNum := 0
			RCtrlClick(DormB,40,15)
			Sleep 2000
			RandSleep(1311,4932)
			RCtrlClick([44,59],29,15)
		} else if(n==4)
		{	;Rank 
			hardNum := 0
			RCtrlClick(RankB,Brx,Bry)
			RandSleep(1311,4932)
			WaitForPixelClick(RankChk,ecc,RetHome,RetHomerx,RetHomery)
		} else
		{
			hardNum++
			if(hardNum > 4)
				i--
		}
		WaitForPixelClick(Home,ecc)
		i++
	} until i > j
	ExpeditionCheck(Home)
	return
}