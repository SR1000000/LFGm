;Expected to be on somewhere with a "Filter By" button
;blank Doll resets filter
TDListFilter(Doll := "")
{
	global ecc, FilterB,FilterBrx,FilterBry, 5Star, 4Star, AssaultRifle, SingleRifle
		, YellowLock1
	DoneB := [589, 457, 0xFFA300], ResetB := [415, 454, 0xDEDEDE]

	WaitForPixelClick(YellowLock1,ecc)
	ClickUntilPixelColor(DoneB,,FilterB,FilterBrx,FilterBry)	;Click Filter BUtton
	if (!Doll)
	{
		RandSleep(200,300)
		ClickUntilPixelNot(ResetB,,ResetB,74,14)	;Click Reset
		RandSleep(200,400)	;Lag after filter change
	}
	else 
	{
		;Sleep 300
		if Doll in %5Star%
			ClickUntilPixelColor([385,145,0xFFB400],,[385,145],44,18) ;Click 5Star until yellow
		else if Doll in %4Star%
			ClickUntilPixelColor([499,145,0xFFB400],,[499,145],39,19) ;Click 4star until yellow
		else
			MsgBox %Doll%'s starlevel not found
		
		Sleep 1300
		if Doll in %AssaultRifle%
			ClickUntilPixelColor([388,331,0xFFB400],,[388,331],39,18) ;Click ARr until yellow
		else if Doll in %SingleRifle%
			ClickUntilPixelColor([610,277,0xFFB400],,[610,277],39,18) ;Click RF until yellow
		else
			MsgBox %Doll%'s type not found
		
		RandSleep(200,400)	;Lag after filter change
		ClickUntilPixelNot(DoneB,,DoneB,71,12)	;Click done
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
	ClickUntilPixelColor(NightCEColor,,ta,15,69)
	Sleep 300

	ClickUntilPixelColor(EchNum2,,EchNum2,EchNumrx,EchNumry)	;Select Echelon 2

	WaitForPixelClick(NightCEColor,ecc)
	ClickUntilPixelNot(NightCEColor,,EchSlot2,EchSlotrx,EchSlotry)	;Click Slot 2

	if(!SameStarType(Doll1,Doll2))
	{
		TDListFilter()
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
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	return
}

ResupplyDPS(heliXY,heliR := 10)
{
	global EchF, RedSangvis
	ResupplyB := [739, 457, 0x343332]
	ResupplyBrx := 54
	ResupplyBry := 12
	ClickUntilPixelColor(EchF,, heliXY, heliR)	;Takes two clicks
	WaitForPixelClick(ResupplyB,ecc)
	ClickUntilPixelColor(RedSangvis,,ResupplyB,ResupplyBrx,ResupplyBry)
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