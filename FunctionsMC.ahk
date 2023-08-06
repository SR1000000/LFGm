CheckStartBattle(ByRef Stage) {
	global StartBattleCheck, StartBattleB, StartBattleBr
	if(Stage!=1)
		return 0
	if(!PixelNot(StartBattleCheck))
	{	
		;DoThisUntilThat("RCtrlClick","PixelNot",600,StartBattleCheck,,StartBattleB, StartBattleBr)
		Stage := 2
		return 1
	}
	return 0
}

CheckAuto(ByRef Stage, ArenaAuto) {
	global AutoB, AutoBr
	if(Stage!=2)
		return 0
	if(!PixelNot(AutoB))
	{
		;if(ArenaAuto==1)
		;	DoThisUntilThat("RCtrlClick","PixelNot",600,AutoB,,AutoB,AutoBr)
		;else
		;	MsgBox, Check
		MouseGetPos, tx, ty
		ToolTip, Auto`n=====`n=====`n=====, %tx%, %ty%
		SetTimer, RemoveToolTip, -5000
		;Stage := 3
		return 1
	}
	return 0
}

CheckWhiteNext(ByRef Stage) {
	global WhiteNextB, WhiteNextBr
	if(Stage!=2 && Stage!=4)
		return 0
	if(!PixelNot(WhiteNextB))
	{
		;DoThisUntilThat("RCtrlClick","PixelNot",600,WhiteNextB,,WhiteNextB,WhiteNextBr)
		MouseGetPos, tx, ty
		ToolTip, Next`n=====`n=====`n=====, %tx%, %ty%
		SetTimer, RemoveToolTip, -5000
		;Stage := 2
		return 1
	}	

	return 0
}

CheckNextBattle(ByRef Stage) {
	global NextBattleB, NextBattleBr
	if(Stage!=4)
		return 0
	if(!PixelNot(NextBattleB))
	{
		;DoThisUntilThat("RCtrlClick","PixelNot",600,NextBattleB,,NextBattleB, NextBattleBr)
		Stage := 1
		return 1
	}	
	
	return 0
}

CheckRepeatFail() {
	global CheckRF
	if(!PixelNot(CheckRF))
	{
		MsgBox, Check
		return 1
	}
	return 0
}