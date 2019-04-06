/*
	GUI for me nox macros
	MUST BE RUN -AFTER- NOX IS LOADED
*/
#NoEnv
#Persistent
#SingleInstance
#Include Click.ahk
#Include CorpseDrag.ahk
#Include Drag.ahk
#Include FindClick.ahk
#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk
#Include Maps.ahk
#Include MapsNF.ahk
#Include PixelCheck.ahk
#Include PixelConstants.ahk
#Include RandomFunctions.ahk
#Include Search.ahk

if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

IniRead, WINID, config.ini, Variables, WINID, 0

IniRead, CSTitle, config.ini, Variables, CSTitle, 0

IniRead, TWinX, config.ini, Variables, LastXS, 0

IniRead, TWinY, config.ini, Variables, LastYS, 0
IniRead, IntervalV1, config.ini, Variables, IntervalV1, 0
IniRead, IntervalV2, config.ini, Variables, IntervalV2, 0
IniRead, WorldV, config.ini, Variables, WorldSwitcher 
IniRead, CorpseDragV, config.ini, Variables, CorpseDragV, 0
IniRead, Repeat, config.ini, Variables, Repeat, 1
IniRead, Carry43e, config.ini, Variables, Carry43e, ""
IniRead, Carry02, config.ini, Variables, Carry02, ""
IniRead, Carry32n, config.ini, Variables, Carry32n, ""

Menu, Tray, Icon, %A_ScriptDir%/favicon_ahkcsortie.ico,,1
CoordMode, Pixel, Relative
SendMode Input

Initialize()


Gui, 1: New
Gui, 1: Default
Gui, Add, Text, x10 y10 w50 h20 , Routine:
Gui, Add, DropDownList, x60 y6 w60 h20 r5 Choose3 gWorldNotes vWorldV, 4-3E|0-2|3-2N|123-6|456-6|1-6|2-6|3-6|4-6|5-6|6-6|6-4E ;3-6F|4-6F|5-6F|
GuiControl, ChooseString, WorldV, %WorldV%
Gui, Add, Text, x130 y10 w40 h20 , Repeat:
Gui, Add, Edit, x170 y8 w50 h20 Number vRepeat -VScroll, 1
Gui, Add, UpDown,, %Repeat%
Gui, Add, Button, x230 y8 w100 h20 gExecuteF vExecute, Execute
Gui, Add, Progress, x230 y30 w100 h20 cGreen vProgA, 0
Gui, Add, Checkbox, x10 y30 vCorpseDragV gCorpseDrag, Corpse dragging
GuiControl,, CorpseDragV, %CorpseDragV%
Gui, Add, Checkbox, x10 y50 vNoRepair, Stop before Repair
Gui, Add, Text, x10 y70 w60 h20 , Interval1(s):
Gui, Add, Text, x10 y90 w60 h20 , Interval2(s):
Gui, Add, Edit, x70 y70 w60 h20 Number vIntervalV1 gIntervalF1 -VScroll, %IntervalV1%
Gui, Add, Edit, x70 y90 w60 h20 Number vIntervalV2 gIntervalF2 -VScroll, %IntervalV2%
Gui, Add, Checkbox, x110 y30 vSwapC gSwapCF, Swap Carry
Gui, Add, Text, x190 y30 w50 h20 vIter, Iter: 0
Gui, Add, Text, x140 y50 w180 h90 vNotes, % MapNotes(WorldV)
Gui, Add, Edit, x10 y140 w320 h20 vStatA ReadOnly, Inactive
Gui, Add, Text, x10 y170 w100 h20 , Tales of Erin
Gui, Add, Button, x10 y190 w100 h30 gDivin, Repeat Divinity
Gui, Add, Progress, x110 y190 w40 h30 cGreen vProgB, 0
Gui, Add, Button, x150 y190 w100 h30 gMBJoin, MB Join
Gui, Add, Progress, x250 y190 w40 h30 cGreen vProgC, 0
Gui, Add, Button, x290 y160 w40 h30 gTest, Test
Gui, Add, Button, x290 y190 w40 h30 gTest2, Test2
Gui, Add, Edit, x10 y230 w320 h20 vStatB ReadOnly, Inactive
; Generated using SmartGUI Creator 4.0
Menu, Main, Add, Pause, Pause2
Gui, Menu, Main
Gui, Show, X%TWinX% Y%TWinY% Autosize, Macros


if not WinExist(WINID)
{
	MsgBox % "Nox window not detected, things may break."
}

^Escape::ExitApp

#Include testings.ahk	;test-hotkeys

tohex(num)
{
  VarSetCapacity(buf, 40)
  ;Change the %X to lowercase if you want the hex output in lowercase (ex: ff instead of FF)
  if num is integer
     DllCall("wsprintf", "str", buf, "str", "%X", "int64", num)
  if num is float
     DllCall("wsprintf", "str", buf, "str", "%X", "float", num)
  return buf
}


Divin:	
	DivinToggle := !DivinToggle
	if (DivinToggle)	;DivinToggle starts at 0, line above makes it true
	{
		NumClicks := 0
		GuiControl,, StatB, Divinity Engaged, Clicks: %NumClicks%
		GuiControl,, ProgB, 100
		SetTimer, Divin2, 1100
	} else
	{
		GuiControl,, StatB, Inactive
		GuiControl,, ProgB, 0
		SetTimer, Divin2, Off
	}	
return

Divin2:
	DD := [725, 500]
	if(AeroGetPixel(745,448,2) = 0xFFFFFF)
	{
		RCtrlClick(DD,25)
		NumClicks += 1
		GuiControl,, StatB, Divinity Engaged, Clicks: %NumClicks%
		RandSleep(250,330)
		if(AeroGetPixel(100,139) != 0xE1DDBB)
		{
			RCtrlClick(DD,25)
			NumClicks += 1
			GuiControl,, StatB, Divinity Engaged, Clicks: %NumClicks%
		}
	} 
	RandSleep(1,255)

return

MBJoin:
	MBJToggle := !MBJToggle
	if (MBJToggle)
	{
		GuiControl,, ProgC, 100
		SetTimer, MBJoin2, 3000
	} else
	{
		GuiControl,, ProgC, 0
		SetTimer, MBJoin2, Off
	}
return

MBJoin2:
	if(AeroGetPixel(724,217,2) = 0x226687)
	{
		RCtrlClick([745,215],35,14)
		NumClicks += 1
		RandSleep(430,790)
		if(AeroGetPixel(724,217,2) = 0x226687)
		{
			RCtrlClick([400,382],50,13)
			NumClicks += 1
		}
		GuiControl,, StatB, MBJoin Engaged, Clicks: %NumClicks%
		Random, t, 1500, 5500
		if (MBJToggle) 
			SetTimer, MBJoin2, %t%
	}
	else if(AeroGetPixel(445,538,2) = 0x04EEFF)
	{
		RCtrlClick([700,500],60)
		NumClicks += 1
		GuiControl,, StatB, MBJoin Engaged, Clicks: %NumClicks%
		if (MBJToggle)
			SetTimer, MBJoin2, 500
	} else
		if (MBJToggle)  
			SetTimer, MBJoin2, 5000
	RandSleep(1,299)
return

Pause2:
	GuiControl,, ProgA, 0
	Pause

return




ExpeditionCheck(pc)	;pc is expected expedition-less pixel color
{
	global Exped, ExpedOK, Safe, Saferx, Safery, Home
	loopcount := 0, Found := 0
	if(!pc.length())
	{
		MsgBox Empty or NonArray pc passed to ExpeditionCheck, Exiting
		Exit
	}
	
	;GuiControl,, StatA, Waiting for Home %ClickCount%
	WaitForPixelClick(pc,3)
	
	;two continuous counts of pc pixel true
	while loopcount < 2
	{	
		Sleep 500
		GuiControl,, StatA, ExpeditionCheck running %ClickCount%
		if (AeroGetPixel(pc[1],pc[2],2) = pc[3])
		{
			GuiControl,, StatA, ExpeditionCheck pixel found once %ClickCount%
			loopcount++
		}
		else
		{
			GuiControl,, StatA, Clicking away Expeditions
			;Strike 1: Exped fails on combat page
			WaitForPixelClick(Exped,2,Safe,Saferx,Safery)
			GuiControl,, StatA, Clicking Expeditions OK Button
			WaitForPixelClick(ExpedOK,2,ExpedOK,35,15)
			loopcount := 0
		}
	}
	GuiControl,, StatA, ExpeditionCheck Complete %ClickCount%
	return
}


RepairCheck(force := 0)
{
	local ta
	GuiControl,, StatA, RepairCheck running %ClickCount%
	if ((AeroGetPixel(RepairEx[1],RepairEx[2]) = RepairEx[3]) || force)
	{
		if (NoRepair)
		{
			GuiControl,, StatA, NoRepair = 1 so Exit %ClickCount%
			MsgBox NoRepair = 1 so Exit
			CleanExit()
		}

		ClickUntilPixelNot(RepairEx,,RepairB,40,15)

		GuiControl,, StatA, Clicking Open Repair Slot %ClickCount%
		;WaitForPixelClick(RepairSl1,ecc,RepairSl1,15,24)
		ta := StrSplit(WGImageSearch("RepairSelect",ecc,50),",")
		ta[3] := AeroGetPixel(ta[1],ta[2])
		ClickUntilPixelNot(ta,,ta,48)

		GuiControl,, StatA, Clicking Slot1 %ClickCount%
		WaitForPixelClick([31,229,0xFFBB00],ecc)
		ClickUntilPixelColor(Slot0Chk,,Slot0,38)

		Sleep 200
		ClickUntilPixelNot(RepairOK,,RepairOK,44,36)

		Sleep 300
		ClickUntilPixelNot(RepairQR,,RepairQR,13)

		Sleep 200
		ClickUntilPixelNot(RepairOKOK,,RepairOKOK,36,14)

		Sleep 300
		;RCtrlClick(RepairCp,36,14)
		LookForClickClose(1)

		GuiControl,, StatA, Clicking RetHome %ClickCount%
		WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
		ExpeditionCheck(Home)
	}
	GuiControl,, StatA, RepairCheck Complete %ClickCount%
	return
}

IntervalF1:
	Gui, submit,nohide
	SortieInterval1 := IntervalV1 * 1000
return

IntervalF2:
	Gui, submit,nohide
	SortieInterval2 := IntervalV2 * 1000
return

WorldNotes:
	Gui, submit,nohide
	GuiControl,, Notes, % MapNotes(WorldV)
return

CorpseDrag:
	Gui, submit,nohide
	GuiControl,, Notes, % MapNotes(WorldV)
return

SwapCF:
	Gui, submit,nohide
	GuiControl,, Notes, % MapNotes(WorldV)
return

;SSBF in precursor script
ExecuteF: 
	ClickCount := 0
	RepeatCount := 0	;local
	Timed := A_TickCount

	GuiControl,, ProgA, 100
	GuiControl, Hide, Execute
	GuiControlGet, mapPick,, WorldV		;local
	GuiControlGet, mapDrag,, CorpseDragV	;local
	IniWrite, %mapPick%, config.ini, Variables, WorldSwitcher	
	IniWrite, %mapDrag%, config.ini, Variables, CorpseDragV		
	GuiControlGet, Repeat	;local	
	IniWrite, %Repeat%, config.ini, Variables, Repeat
	GuiControlGet, NoRepair	;local
	GuiControlGet, SwapC
	MapInit(mapPick)	;local
	;MsgBox % "Reminder: Corpse Dragging is turned " (mapDrag ? "ON" : "OFF")

	while RepeatCount < Repeat
	{
		FileDelete, TroubleLog.txt
		FileAppend, Start Troubleshooting Log`n, TroubleLog.txt
		RepeatCount++
		GuiControl,, Iter, % "Iter: " RepeatCount
		RepairCheck()
		RunMap(mapPick)
		ExpeditionCheck(Home)
		Swap(Doll1,Doll2)
	}
	Timed := (A_TickCount - Timed)/1000
	Timedm := Floor(Timed/60)
	Timeds := Round(Mod(Timed,60))
	GuiControl,, StatA, Execute finished. Clicked:%ClickCount% Timed:%Timedm%m%Timeds%s
	MsgBox Execute Finished
	CleanExit()
return	

CleanExit()
{
	GuiControl, Show, Execute
	GuiControl,, ProgA, 0
	GuiControl,, Iter, Iter: 0
	Exit
	return

}

Test:
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
return

Test2:
	;ExpeditionCheck(RetHome)
return

Pause::Pause

Initialize()
{
	global
	uid := WinExist(WINID)
	DivinToggle := 0
	MBJToggle := 0
	Class := 0
	ClickDelay := 50
	ecc := -15
	ClickCount := 0
	WinGetPos,,,WinWidth,WinHeight,%WINID%
	Doll1 := ""
	Doll2 := ""
	MapDrag = 0
	5Star := "Type97,OTS14,HK416,G41,Type95,G11,FAL,WA2K"
	4Star := "AR15,M4A1,SOP2,TAR21,SVD"
	AssaultRifle := "Type97,OTS14,HK416,G41,Type95,G11,FAL,AR15,M4A1,SOP2,TAR21"
	SingleRifle := "WA2K,SVD"
	init_drag()
}

GuiClose:
	WinGetPos,TWinX,TWinY
	IniWrite,%TWinX%,config.ini,Variables,LastXS
	IniWrite,%TWinY%,config.ini,Variables,LastYS
	IniWrite,%IntervalV1%,config.ini,Variables,IntervalV1
	IniWrite,%IntervalV2%,config.ini,Variables,IntervalV2
ExitApp