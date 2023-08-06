
Swap(Byref x, Byref y)
{
	t := x
	x := y
	y := t
	return
}

CSend(v := "a", a := 0, b := 100) {
	global CSTitle
	RandSleep(a,b)

	BlockInput On
	ControlSend,, %v%, %CSTitle%
	BlockInput Off

}

DoThisUntilThat(thisF,thatF,Delay := 100,thatParam1 := "",thatParam2 := "", thisParam1 := "", thisParam2 := "")
{
	i := 0, t := ""
	
	if(!IsFunc(thisF) or !IsFunc(thatF))
	{
		MsgBox Error, invalid function names passed to DTUT, %this% %that%
		Exit
	}
	loop
	{
		if(thisParam1.length() > 1)
			TTi1 := StrSplit(thisParam1, ",")
		else
			TTi1 := thisParam1
		if(thisParam2.length() > 1)
			TTi2 := StrSplit(thisParam2, ",")
		else
			TTi2 := thisParam2
		if(thatParam1.length() > 1)
			TTa1 := StrSplit(thatParam1, ",")
		else
			TTa1 := thatParam1
		if(thatParam2.length() > 1)
			TTa2 := StrSplit(thatParam2, ",")
		else
			TTa2 := thatParam2
		
		GuiControl,, StatA, %i% Doing %thisF% %TTi1% %TTi2% until %thatF% %TTa1% %TTa2%
		if(thisParam1)
			if(thisParam2)
				%thisF%(thisParam1,thisParam2)	
			else
				%thisF%(thisParam1)
		else
			%thisF%()

		Sleep %Delay%

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

RandSleep(a,b) 
{
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
