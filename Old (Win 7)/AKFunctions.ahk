RepeatCheckResults(ByRef Stage) {
	global RepeatPeriod, RepeatPeriodMin
	ta := StrSplit(GImageSearch("Results",,327,372,339,557),",")
	if(ta.Length())
	{
		RCtrlClick([160,480],80,70)
		Stage := 2
		RepeatPeriod := RepeatPeriodMin
		RandSleep(1,1599)
		;GuiControl,, StatB, Result
	} ;else
		;GuiControl,, StatB, ResultNotFound
	Sleep 100
	return
}

RepeatCheckStart(Stage) {
	if(Stage!=2)
		return 0

	ta := StrSplit(GImageSearch("BlueStart",10,840,455,930,490),",")
	while(ta.Length())
	{
		RCtrlClick([855,525],70,20)
		RandSleep(1000,1599)
		ta := StrSplit(GImageSearch("BlueStart",10,840,455,930,490),",")
		if(!ta.Length())
		{
			return 1
		}
	}
	Sleep 100
	return 0
}


RepeatCheckMissionStart(ByRef Stage) {
	if(Stage!=2)
		return 0
	global RepeatPeriod, RepeatPeriodMax

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
	Sleep 100
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