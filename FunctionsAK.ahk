RepeatCheckResults(ByRef Stage) {
	global RepeatPeriod, RepeatPeriodMin, LevelUpCheck, TimeOfLastResult, ResultPixel, ResultNext
		, SafeClick, SafeClickr
	
	if((A_TickCount/1000)-TimeOfLastResult>360) {
		MsgBox, Error, too much time since last result, %Stage% %ResultNext%
		Gosub, RepeatQ
	}
	if(Stage!=1)
		return 0

	if(!PixelNot(LevelUpCheck))
		RCtrlClick(SafeClick,SafeClickr)

	if(ResultNext==1)
	{
		if(PixelNot(ResultPixel))
		{
			Stage := 2
			RepeatPeriod := RepeatPeriodMid
			TimeOfLastResult := A_TickCount/1000
			ResultNext := 0
			return 1
		}
	}

	if(!PixelNot(ResultPixel))
	{
		;MsgBox, About to Click
		RCtrlClick(SafeClick,SafeClickr)
		RepeatPeriod := RepeatPeriodMid
		ResultNext := 1
	}

	Sleep 100
	return 0
}

RepeatCheckStart(ByRef Stage) {
	global BlueStartB, BlueStartBrx, BlueStartBry
	if(Stage!=2)
		return 0

	while(!PixelNot(BlueStartB))
	{
		RCtrlClick(BlueStartB,BlueStartBrx,BlueStartBry)
		RandSleep(500,800)
		if(PixelNot(BlueStartB))
		{
			Stage := 3
			return 1
		}
	}
	/*
	ta := StrSplit(GImageSearch("BlueStart",5,840,455,930,490),",")
	while(ta.Length())
	{
		RCtrlClick([855,545],70,15)
		RandSleep(1000,1599)
		ta := StrSplit(GImageSearch("BlueStart",5,840,455,930,490),",")
		if(!ta.Length())
		{
			Stage := 3
			return 1
		}
	}
	*/
	Sleep 100
	return 0
}


RepeatCheckMissionStart(ByRef Stage) {
	global RepeatPeriod, RepeatPeriodMax, MissionStartB, MissionStartBrx, MissionStartBry

	if(Stage!=3)
		return 0
	while(!PixelNot(MissionStartB))
	{
		RCtrlClick(MissionStartB,MissionStartBrx,MissionStartBry)
		RandSleep(500,800)
		if(PixelNot(MissionStartB))
		{
			RepeatPeriod := RepeatPeriodMax
			Stage := 1
			return 1
		}
	}
	/*
	ta := StrSplit(GImageSearch("MissionStart",,810,400,840,430),",") 
	while(ta.Length())
	{
		RCtrlClick([830, 410],45,80)
		RandSleep(1500,2299)
		ta := StrSplit(GImageSearch("MissionStart",,810,400,840,430),",")
		if(!ta.Length())
		{
			RepeatPeriod := RepeatPeriodMax
			Stage := 1
			return 1
		}
	}
	*/
	Sleep 100
	return 0
}

FriendBase() {
	global FriendBaseCheck, NextB, NextBr
	;if(Stage!=0)
	;	return 0
	if(!PixelNot(FriendBaseCheck))
	{
		Sleep, 2000
		DoThisUntilThat("RCtrlClick","PixelNot",1000,FriendBaseCheck,,NextB, NextBr)
		return 1
	}
	return 0
}


;Active check if stage is 1
FishCheck(Stage) {
	fchk := [125, 407, 0x393949]
	if(Stage && PixelNot(fchk))
		return 1
	return 0
}

;Active click if stage is 0
CastOutClickCheck(Stage) {
	ta := StrSplit(GImageSearch("CastOut",10,172,765,355,804),",")
	if(!Stage && ta.Length())
	{
		while(ta.Length())
		{
			RCtrlClick([265,783],160,20)
			Sleep 900
			ta := StrSplit(GImageSearch("CastOut",10,172,765,355,804),",")
		}
		return 1
	}
	return 0
}