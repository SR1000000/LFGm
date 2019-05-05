;Expected to be on somewhere with a "Filter By" button
;blank Doll resets filter
TDListFilter(Doll := "")
{
	global ecc, FilterB,FilterBrx,FilterBry, 5Star, 4Star, AssaultRifle, SingleRifle
		, YellowLock1
	DoneB := [588, 454, 0xFFA300], ResetB := [415, 454, 0xFFFFFF]
	, 5StarB := [385,145,0xFFB400], 4StarB := [499,145,0xFFB400]

	WaitForPixelClick(YellowLock1,ecc)
	ClickUntilPixelColor(DoneB,,FilterB,FilterBrx,FilterBry)	;Click Filter BUtton
	if (!Doll)
	{
		RandSleep(200,300)
		ClickUntilPixelNot(ResetB,,ResetB,74,14)	;Click Reset
		RandSleep(1500,2000)	;Lag after filter change
	}
	else 
	{
		if Doll in %5Star%
			ClickUntilPixelColor(5StarB,,5StarB,44,18) ;Click 5Star until yellow
		else if Doll in %4Star%
			ClickUntilPixelColor(4StarB,,4StarB,39,19) ;Click 4star until yellow
		else
			MsgBox %Doll%'s starlevel not found
		
		RandSleep(1500,2000)	;Lag after filter change
		if Doll in %AssaultRifle%
			ClickUntilPixelColor([388,331,0xFFB400],,[388,331],39,18) ;Click ARr until yellow
		else if Doll in %SingleRifle%
			ClickUntilPixelColor([610,277,0xFFB400],,[610,277],39,18) ;Click RF until yellow
		else
			MsgBox %Doll%'s type not found
		
		RandSleep(1500,2000)	;Lag after filter change
;Strike1: buggy clicking done, increased sleep before
		ClickUntilPixelNot(DoneB,,DoneB,71,12)	;Click done
	}
	return
}

;Expected to be on somewhere with a "Filter By" button
FilterSwitch45()
{
	global ecc,FilterB,FilterBrx,FilterBry,DoneB,YellowLock1
	DoneB := [588, 454, 0xFFA300], 5StarB := [385,145,0xFFB400], 4StarB := [499,145,0xFFB400]

	WaitForPixelClick(YellowLock1,ecc)
	ClickUntilPixelColor(DoneB,,FilterB,FilterBrx,FilterBry)	;Click Filter BUtton
	;Sleep 500
	if(PixelIs(5StarB))
	{
		ClickUntilPixelNot(5StarB,,5StarB,36,18)
		ClickUntilPixelColor(4StarB,,4StarB,36,18)
	} else if(PixelIs(4StarB))
	{
		ClickUntilPixelNot(4StarB,,4StarB,36,18)
		ClickUntilPixelColor(5StarB,,5StarB,36,18)
	} else
		MsgBox FilterSwitch45 Failed

	RandSleep(1500,2000)	;Lag after filter change
	ClickUntilPixelNot(DoneB,,DoneB,71,12)	;Click done
	return
}


SameStarType(a,b)
{
	global 5Star, 4Star, AssaultRifle, SingleRifle

	if(InStr(5Star,a) and InStr(5Star,b))
	{
		if(InStr(AssaultRifle,a) and InStr(AssaultRifle,b))
			return 1
		else if(InStr(SingleRifle,a) and InStr(SingleRifle,b))
			return 1
	}
	else if(InStr(4Star,a) and InStr(4Star,b))
	{
		if(InStr(AssaultRifle,a) and InStr(AssaultRifle,b))
			return 1
		else if(InStr(SingleRifle,a) and InStr(SingleRifle,b))
			return 1
	}
	return 0
}

;Expected to be on choose deploy echelon screen
;Depends on global Doll1, Doll2
SwitchDPS()
{
	local ta := []
	WaitForPixelClick(EchF,ecc)
	ClickUntilPixelNot(EchF,,EchF,EchFrx,EchFry)	;Click Red Echelon Formation button

	WaitForPixelClick(NightCEColor,ecc)		;WaitFor screen to load (teal nightCE)
	ClickUntilPixelNot(NightCEColor,,EchSlot1,EchSlotrx,EchSlotry)	;Click Slot 1 when screen loads
										
	TDListFilter(Doll2)
	
	WaitForPixelClick(YellowLock1,ecc)
	ta := StrSplit(IGImageSearch("DollList\" Doll2,40),",")
	ta[1] += 30
	ta[2] += -69
	;Sleep 300
	ClickUntilPixelNot(FilterB,,ta,15,69)
	Sleep 300

	ClickUntilPixelColor(EchNum2,,EchNum2,EchNumrx,EchNumry)	;Select Echelon 2

	WaitForPixelClick(NightCEColor,ecc)
	ClickUntilPixelNot(FormMagnifier,,EchSlot2,EchSlotrx,EchSlotry)	;Click Slot 2

	if(!SameStarType(Doll1,Doll2))
	{
		FilterSwitch45()
		;TDListFilter()
		;TDListFilter(Doll1)
	}
	WaitForPixelClick(YellowLock1,ecc)
	ta := StrSplit(IGImageSearch("DollList\" Doll1,40),",")
	ta[1] += 30
	ta[2] += -69
	;Sleep 200
	ClickUntilPixelNot(FilterB,,ta,15,69)
	Sleep 500
	ClickUntilImage("LoadScreen",,RetHome,RetHomerx,RetHomery)
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	return
}

ResupplyDPS(heliXY,heliR := 10)
{
	global ecc, DepNightC
	ResupplyB := [739, 457, 0x353431]
	ResupplyBrx := 54
	ResupplyBry := 12
	ClickUntilPixelColor(DepNightC,, heliXY, heliR)	;Takes two clicks
	WaitForPixelClick(ResupplyB,ecc)
	ClickUntilPixelNot(DepNightC,,ResupplyB,ResupplyBrx,ResupplyBry)
	return
}

/*
;Expected to be on deploy echelon screen
;Depends on global Doll1, Doll2
ReplaceDPS2(doll, slot)
{
	global

	return
}

*/