Swap(Byref x, Byref y)
{
	t := x
	x := y
	y := t
	return
}

DoThisUntilThat(thisF,thatF,thatParam1,thatParam2 := "", thisParam1 := "", thisParam2 := "")
{
	i := 0, t := ""
	GuiControl,, StatA, Doing %thisF% %thisParam1% %thisParam2% until %thatF% %thatParam1% %thatParam2%
	if(!IsFunc(thisF) or !IsFunc(thatF))
	{
		MsgBox Error, invalid function names passed to DTUT, %this% %that%
		Exit
	}
	loop
	{
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