/*
Gui, Add, Text, x10 y130 w100 h20 , Another Eden
Gui, Add, Button, x10 y150 w100 h30 gAEGrind, Grind
Gui, Add, Progress, x110 y150 w20 h30 cGreen vProgD, 0
Gui, Add, Button, x130 y150 w100 h30 gTextSkip, TextSkip
Gui, Add, Progress, x230 y150 w20 h30 cGreen vProgD2, 0

Gui, Add, DropDownList, x10 y190 w60 h20 r5 Choose1 gButtonNotes vButton, Zeroth|First|Second|Third|Fourth|Fifth|Sixth
Button := "Zeroth"
Gui, Add, Text, x80 y195 w280 h20 vNotes, % ButtonNotes(Button)


XButton1::
	GoSub, TextSkip
return

XButton2::
	DoButton(Button)
return

^T::  Gosub, TextSkip

AEGrind:
	Toggle := !Toggle
	if (Toggle)
	{
		GuiControl,, ProgD, 100
		i := 0, FightCount := 0, ClickCount := 0, RepeatStage := 1, dir := 0
		RepeatPeriod := GrindPeriodMax
		SetTimer, AEGrind2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgD, 0
		SetTimer, AEGrind2, Off
		GuiControl,, StatA, % "Inactive"
		GuiControl,, StatB, % "Inactive"
	}
return

AEGrind2:
	GuiControl,, StatB, % "AEGrind i:" i++ " Stage:" RepeatStage " Fights:" FightCount " Clicks:" ClickCount
	
	GrindMapMove(RepeatStage,dir)
	FightStart(RepeatStage,Button)
	if(EndFight(RepeatStage)==1)
		FightCount++
	if(FightCount>80)
	{
		MsgBox, MaxFight Ending
		Gosub, AEGrind
	}

	if (Toggle)  
	{
		Random, rand, 0, 300
		RRP := RepeatPeriod + rand
		SetTimer, AEGrind2, %RRP%
	}
return

TextSkip:
	Toggle := !Toggle
	if (Toggle)
	{
		GuiControl,, ProgD2, 100
		i := 0, k := 0, ClickCount := 0
		RepeatPeriod := 500
		SetTimer, TextSkip2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgD2, 0
		SetTimer, TextSkip2, Off
		GuiControl,, StatA, % "Inactive"
		GuiControl,, StatB, % "Inactive"
	}
return

TextSkip2:
	GuiControl,, StatB, % "TextSkip " i++ " " RepeatStage " " ClickCount

	if(!PixelNot(TextBox))
	{
		RCtrlClick(Safe,Saferx,Safery)
		k := 0
	} else
		k++

	if(k>30)
	{
		MsgBox, Check
		k := 0
	}

	if (Toggle)  
	{
		Random, rand, 0, 100
		RRP := RepeatPeriod + rand
		SetTimer, TextSkip2, %RRP%
	}
return

ButtonNotes:
	Gui, submit,nohide
	GuiControl,, Notes, % ButtonNotes(Button)
return

*/

ButtonNotes(script) {
	if(script=="Zeroth") {
		return "SwitchOnly"
	} else if(script=="First") {
		return "MigCastle VH - 1Switch.3.1.x"
	} else if(script=="Second") {
		return "GaruleaO - 2Switch.2.3(Inari)(Temp)"
	} else if(script=="Third") {
		return "GaruleaO - 2SwitchOnly"
	} else if(script=="Fourth") {
		return "GaruleaO - 1Switch.1.2.3(Ver)(Wik)(Jir)"
	} else if(script=="Fifth") {
		return "GaruleaO - 1Switch.1.1.3(Kunlun)"
	} else if(script=="Sixth") {
		return "GaruleaO - 1Switch.1.1.2(Mahora)"
	} else
		return "Unknown Script Error"
}

DoButton(script) {
	global RunB, ActionB, ActionBr
	if(script=="Zeroth") {
		SwitchUnit()
	} else if(script=="First") {
		StageUnitMoves([2,3], [3,1])
		SwitchUnit()
	} else if(script=="Second") {
		StageUnitMoves([3,2], [4,3])
		SwitchUnit()
		SwitchUnit2()
	} else if(script=="Third") {
		SwitchUnit()
		SwitchUnit2()
	} else if(script=="Fourth") {
		StageUnitMoves([2,1], [3,2], [4,3])
		SwitchUnit()
	} else if(script=="Fifth") {
		StageUnitMoves([2,1], [3,1], [4,3])
		SwitchUnit()
	} else if(script=="Sixth") {
		StageUnitMoves([2,1], [3,1], [4,2])
		SwitchUnit()
	}
	WaitForPixelClick(RunB,-5)
	DoThisUntilThat("RCtrlClick","PixelNot",,RunB,,ActionB,ActionBr)
}

GrindMapMove(ByRef RepeatStage, ByRef dir) {
	global AFBar

	if(RepeatStage!=1)
		return 0
	if(!PixelNot(AFBar)) {
		RepeatStage := 2
		return 1
	}		
	if(dir)
		CSend("q")
	else
		CSend("e")

	dir := !dir
	return -1
}

FightStart(ByRef RepeatStage, script := "") {
	global AFBar, RunB, ActionB, ActionBr

	if(RepeatStage!=2)
		return 0
	DoButton(script)
	RepeatStage := 3
	return
}

SwitchUnit() {
	global AFBar, SwitchB, SwitchBry, SwitchBCheck, RunB, Portraits, PortraitsR, ActionB, ActionBr

	WaitForPixelClick(AFBar,-10)
	DoThisUntilThat("RCtrlClick","PixelIs",,SwitchBCheck,,Portraits[1],PortraitsR)
	DoThisUntilThat("RCtrlClick","PixelNot",,SwitchBCheck,,SwitchB,SwitchBry)
	DoThisUntilThat("RCtrlClick","PixelIs",200,RunB,,Portraits[6],PortraitsR)
	return
}
SwitchUnit2() {
	global AFBar, SwitchB, SwitchBry, SwitchBCheck, RunB, Portraits, PortraitsR, ActionB, ActionBr

	WaitForPixelClick(AFBar,-10)
	DoThisUntilThat("RCtrlClick","PixelIs",,SwitchBCheck,,Portraits[2],PortraitsR)
	DoThisUntilThat("RCtrlClick","PixelNot",,SwitchBCheck,,SwitchB,SwitchBry)
	DoThisUntilThat("RCtrlClick","PixelIs",200,RunB,,Portraits[5],PortraitsR)
	return
}

StageUnitMoves(params*) {
	global AFBar
	for index,param in params
		SelectUnitMove(param[1], param[2])
}

SelectUnitMove(Unit, Move) {
	global AFBar, SwitchBry, SwitchBCheck, MoveBs, Portraits, PortraitsR

	WaitForPixelClick(AFBar,-10)
	DoThisUntilThat("RCtrlClick","PixelIs",,SwitchBCheck,,Portraits[Unit],PortraitsR)
	DoThisUntilThat("RCtrlClick","PixelNot",,SwitchBCheck,,MoveBs[Move],SwitchBry)
	return 1
}


EndFight(ByRef RepeatStage) {
	global Results, Safe, Safery

	if(RepeatStage!=3)
		return 0
	if(!PixelNot(Results))
	{
		DoThisUntilThat("RCtrlClick","PixelNot",,Results,,Safe,Safery)
		RepeatStage := 1
		return 1
	}
	return -1
}
