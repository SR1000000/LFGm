/*
	GUI for me LC macros
	MUST BE RUN -AFTER- LC IS LOADED
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
#Include AKFunctions.ahk
#Include PixelCheck.ahk
#Include PixelConstants.ahk
#Include RandomFunctions.ahk
#Include Search.ahk

if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

IniRead, WINID, configAK.ini, Variables, WINID, 0

IniRead, CSTitle, ConfigAK.ini, Variables, CSTitle, 0

IniRead, TWinX, ConfigAK.ini, Variables, LastXS, 0

IniRead, TWinY, ConfigAK.ini, Variables, LastYS, 0
IniRead, IntervalV1, ConfigAK.ini, Variables, IntervalV1, 0
IniRead, IntervalV2, ConfigAK.ini, Variables, IntervalV2, 0
IniRead, WorldV, ConfigAK.ini, Variables, WorldSwitcher 
IniRead, CorpseDragV, ConfigAK.ini, Variables, CorpseDragV, 0
IniRead, Repeat, ConfigAK.ini, Variables, Repeat, 1
IniRead, Carry43e, ConfigAK.ini, Variables, Carry43e, ""
IniRead, Carry02, ConfigAK.ini, Variables, Carry02, ""
IniRead, Carry32n, ConfigAK.ini, Variables, Carry32n, ""

Menu, Tray, Icon, %A_ScriptDir%/favicon_ahkcsortie.ico,,1
CoordMode, Pixel, Relative
SendMode Input

Initialize()


Gui, 1: New
Gui, 1: Default
Gui, Add, Text, x10 y10 w100 h20 , AK Functions
Gui, Add, Text, x100 y30 w50 h20 vIter, Iter: 0
Gui, Add, Text, x10 y30 w40 h20 , Repeat:
Gui, Add, Edit, x50 y28 w40 h20 Number vRepeat -VScroll, 1
Gui, Add, UpDown,, %Repeat%
Gui, Add, Button, x10 y50 w100 h30 gRepeatQ, Repeat
Gui, Add, Progress, x110 y50 w40 h30 cGreen vProgA, 0
Gui, Add, Button, x150 y50 w100 h30 gFinishQ, Finish
Gui, Add, Progress, x250 y50 w40 h30 cGreen vProgA2, 0

Gui, Add, Text, x10 y170 w100 h20 , TroubleShooting
Gui, Add, Button, x10 y190 w100 h30 gTSS, TakeScreenShot
Gui, Add, Progress, x110 y190 w40 h30 cGreen vProgB, 0
Gui, Add, Button, x150 y190 w100 h30 gFishing, Fishing
Gui, Add, Progress, x250 y190 w40 h30 cGreen vProgC, 0
Gui, Add, Button, x290 y160 w40 h30 gTest, Test
Gui, Add, Button, x290 y190 w40 h30 gTest2, Test2
Gui, Add, Edit, x10 y230 w320 h20 vStatA ReadOnly, Inactive
Gui, Add, Edit, x10 y250 w320 h20 vStatB ReadOnly, Inactive
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


Fishing:
	FishingToggle := !FishingToggle
	if (FishingToggle)
	{
		FishingStage := 0
		ClickCount := 0
		NumChecks := 0
		GuiControl,, ProgC, 100
		SetTimer, Fishing2, 3000
	} else
	{
		GuiControl,, ProgC, 0
		GuiControl,, StatB, Inactive
		SetTimer, Fishing2, Off
	}
return

Fishing2:
	if(CastOutClickCheck(FishingStage))
	{
		FishingStage := 1
		GuiControl,, StatB, Fishing Engaged %FishingStage%, Clicks: %ClickCount%, Checks: %NumChecks%
		Sleep 1500
		if (FishingToggle) 
			SetTimer, Fishing2, 100
	}
	else if(FishCheck(FishingStage))
	{
		RCtrlClick([265,783],160,20)
		if(WaitForPixelClick([268, 768, 0xDADADA], 7, [268, 768], 60, 15))
		{
			if (FishingToggle)
				SetTimer, Fishing2, 2000
		} else
			Sleep 1000
		FishingStage := 0
		NumChecks := 0
	}
	NumChecks += 1
	if(FishingStage==0 && NumChecks>10)
	{
		MsgBox, Fishing Done
		Goto, Fishing
	}
	GuiControl,, StatB, Fishing Engaged %FishingStage%, Clicks: %ClickCount%, Checks: %NumChecks%
return

Pause2:
	GuiControl,, ProgA, 0
	Pause

return



IntervalF1:
	Gui, submit,nohide
	SortieInterval1 := IntervalV1 * 1000
return

IntervalF2:
	Gui, submit,nohide
	SortieInterval2 := IntervalV2 * 1000
return

;Start on Start, check autodeploy on
RepeatQ:
	RPQToggle := !RPQToggle
	if (RPQToggle)
	{
		GuiControl,, ProgA, 100
		RepeatCount := 0, i := 1, ClickCount := 0, Timed := A_TickCount
		GuiControl,, Iter, % "Iter: " RepeatCount
		GuiControlGet, Repeat	;local
		IniWrite, %Repeat%, ConfigAK.ini, Variables, Repeat
		RepeatPeriod := RepeatPeriodMin
		RepeatStage := 2
		SetTimer, RepeatQ2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgA, 0
		SetTimer, RepeatQ2, Off
		GuiControl,, StatB, % "Inactive"
		GuiControl,, Iter, % "Iter: " 0
		Timed := (A_TickCount - Timed)/1000
		Timedm := Floor(Timed/60)
		Timeds := Round(Mod(Timed,60))
		MsgBox, RepeatDone Timed:%Timedm%m%Timeds%s
	}
return

RepeatQ2:
	GuiControl,, StatB, % "RepeatQ2 " i++ " " RepeatStage " " ClickCount
	RepeatCheckResults(RepeatStage)
	RepeatCheckMissionStart(RepeatStage)
	if(RepeatCheckStart(RepeatStage))
	{
		RepeatCount++
		if(RepeatCount>Repeat) {
			GuiControl,, ProgA, 0
			Goto, RepeatQ
		}
	}
	GuiControl,, Iter, % "Iter: " RepeatCount
	

	if (RPQToggle)  
		SetTimer, RepeatQ2, %RepeatPeriod%
return

FinishQ:
	FQToggle := !FQToggle
	if (FQToggle)
	{
		GuiControl,, ProgA2, 100
		i := 0, ClickCount := 0
		RepeatPeriod := RepeatPeriodMax
		RepeatStage := 1
		SetTimer, FinishQ2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgA2, 0
		SetTimer, FinishQ2, Off
		GuiControl,, StatB, % "Inactive"
	}
return

FinishQ2:
	GuiControl,, StatB, % "FinishQ2 " i++ " " RepeatStage " " ClickCount

	RandSleep(1,699)
	if (FQToggle)  
		SetTimer, FinishQ2, %RepeatPeriod%
return

TSS:
	If !pToken := Gdip_Startup()
	{
	   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	   Exit
	}
	pHaystack := Gdip_BitmapFromHWND(uid)
	temp := Gdip_SaveBitmapToFile(pHaystack, "F:\TSS" . tssi . ".png")
	MsgBox, SS Taken %tssi%
	tssi++
	Gdip_DisposeImage(pHaystack)
	Gdip_Shutdown(pToken)
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
	MsgBox, % GImageSearch("Results",,327,372,339,557)
return

Test2:
	RepeatCheckMissionStart(2)
	;MsgBox, % IGImageSearch("MissionStart2")
return

Pause::Pause

Initialize()
{
	global
	uid := WinExist(WINID)
	FQToggle := 0
	RPQToggle := 0
	FishingToggle := 0
	RepeatPeriodMin := 1200
	RepeatPeriodMax := 7000
	Class := 0
	ClickDelay := 50
	ecc := -15
	ClickCount := 0
	WinGetPos,,,WinWidth,WinHeight,%WINID%
	tssi := 1
}

GuiClose:
	WinGetPos,TWinX,TWinY
	IniWrite,%TWinX%,ConfigAK.ini,Variables,LastXS
	IniWrite,%TWinY%,ConfigAK.ini,Variables,LastYS
	IniWrite,%IntervalV1%,ConfigAK.ini,Variables,IntervalV1
	IniWrite,%IntervalV2%,ConfigAK.ini,Variables,IntervalV2
	IniWrite, %Repeat%, ConfigAK.ini, Variables, Repeat
ExitApp