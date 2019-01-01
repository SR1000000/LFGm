;Expected to be on somewhere with a "Filter By" button
;blank Doll resets filter
TDListFilter(Doll := "")
{
	global ecc, FilterB,FilterBrx,FilterBry, 5Star, 4Star, AssaultRifle, SingleRifle

	RCtrlClick(FilterB,FilterBrx,FilterBry)	;Click Filter BUtton
	if (!Doll)
	{
		Sleep 400
		RCtrlClick([415,454],74,14)	;Click Reset
		Sleep 300	;Lag after filter change
	}
	else 
	{
		Sleep 300
		if Doll in %5Star%
			ClickUntilPixelColor([385,145,0xFFB400],,[385,145],44,18) ;Click 5Star until yellow
		else if Doll in %4Star%
			ClickUntilPixelColor([499,145,0xFFB400],,[499,145],39,19) ;Click 4star until yellow
		else
			MsgBox %Doll%'s starlevel not found
		
		Sleep 1000
		if Doll in %AssaultRifle%
			ClickUntilPixelColor([388,331,0xFFB400],,[388,331],39,18) ;Click ARr until yellow
		else if Doll in %SingleRifle%
			ClickUntilPixelColor([610,277,0xFFB400],,[610,277],39,18) ;Click RF until yellow
		else
			MsgBox %Doll%'s type not found
		
		Sleep 300	;Lag after filter change
		RCtrlClick([589,457],71,12)	;Click done
	}
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
	WaitForPixelClick(EchF,ecc,EchF,EchFrx,EchFry)	;Click Red Echelon Formation button

	WaitForPixelClick(NightCEColor,ecc,EchSlot1,EchSlotrx,EchSlotry)	;WaitFor screen to load (yellow magnifying glass)
										;Click Slot 1 when screen loads
	;Strike 1, may replace with ClickUntil
	WaitForPixelClick(YellowLock1,ecc)
	;If (AeroGetPixel(FilterB[1],FilterB[2]) != FilterB[3])	;If Filter button is white, put filter on
		TDListFilter(Doll2)
	
	WaitForPixelClick(YellowLock1,ecc)
	ta := StrSplit(IGImageSearch("DollList\" Doll2,40),",")
	ta[1] += 30
	ta[2] += -69
	;Sleep 300
	ClickUntilPixelColor(NightCEColor,,ta,15,69)
	Sleep 300

	ClickUntilPixelColor(EchNum2,,EchNum2,EchNumrx,EchNumry)	;Select Echelon 2

	WaitForPixelClick(NightCEColor,ecc,EchSlot2,EchSlotrx,EchSlotry)	;Click Slot 2

	if(!SameStarType(Doll1,Doll2))
	{
		WaitForPixelClick(YellowLock1,ecc)
		TDListFilter()
		WaitForPixelClick(YellowLock1,ecc)
		TDListFilter(Doll1)
	}
	WaitForPixelClick(YellowLock1,ecc)
	ta := StrSplit(IGImageSearch("DollList\" Doll1,40),",")
	ta[1] += 30
	ta[2] += -69
	;Sleep 200
	ClickUntilPixelColor(NightCEColor,,ta,15,69)
	Sleep 500
	ClickUntilImage("LoadScreen",,RetHome,RetHomerx,RetHomery)
	WaitForPixelClick(RedSangvis,ecc)
	return
}

ResupplyDPS(heliXY,heliR := 10)
{
	global EchF
	ResupplyB := [739, 457, 0x343332]
	ResupplyBrx := 54
	ResupplyBry := 12
	ClickUntilPixelColor(EchF,, heliXY, heliR)	;Takes two clicks
	WaitForPixelClick(ResupplyB,ecc)
	ClickUntilPixelNot(ResupplyB,,ResupplyB,ResupplyBrx,ResupplyBry)
	LookForClickClose(0.7)
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