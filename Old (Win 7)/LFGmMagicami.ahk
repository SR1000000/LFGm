/*
	GUI for me Nox macros
	MUST BE RUN -AFTER- Nox IS LOADED
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
#Include FunctionsMC.ahk
#Include PixelCheck.ahk
#Include PixelConstantsMC.ahk
#Include RandomFunctions.ahk
#Include Search.ahk

if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

IniRead, WINID, ConfigMC.ini, Variables, WINID, 0

IniRead, CSTitle, ConfigMC.ini, Variables, CSTitle, 0

IniRead, TitleGUI, ConfigMC.ini, Variables, TitleGUI, 0

IniRead, TWinX, ConfigMC.ini, Variables, LastXS, 0

IniRead, TWinY, ConfigMC.ini, Variables, LastYS, 0
IniRead, IntervalV1, ConfigMC.ini, Variables, IntervalV1, 0
IniRead, IntervalV2, ConfigMC.ini, Variables, IntervalV2, 0
IniRead, WorldV, ConfigMC.ini, Variables, WorldSwitcher 
IniRead, CorpseDragV, ConfigMC.ini, Variables, CorpseDragV, 0
IniRead, Repeat, ConfigMC.ini, Variables, Repeat, 1
IniRead, Carry43e, ConfigMC.ini, Variables, Carry43e, ""
IniRead, Carry02, ConfigMC.ini, Variables, Carry02, ""
IniRead, Carry32n, ConfigMC.ini, Variables, Carry32n, ""

Menu, Tray, Icon, %A_ScriptDir%/favicon_ahkcsortie.ico,,1
CoordMode, Pixel, Relative
SendMode Input

Initialize()


Gui, 1: New
Gui, 1: Default
Gui, Add, Text, x100 y5 w50 h20 vIter, Iter: 0
Gui, Add, Text, x10 y5 w40 h20 , Repeat:
Gui, Add, Edit, x50 y3 w40 h20 Number vRepeat -VScroll, 1
Gui, Add, UpDown,, %Repeat%
Gui, Add, Text, x10 y30 w100 h20 , AK Functions

Gui, Add, Button, x10 y50 w100 h30 gRepeatQ, Repeat
Gui, Add, Progress, x110 y50 w20 h30 cGreen vProgA, 0
Gui, Add, Button, x130 y50 w100 h30 gFinishQ, Finish
Gui, Add, Progress, x230 y50 w20 h30 cGreen vProgA2, 0

Gui, Add, Button, x10 y90 w100 h30 gFriendExit, FriendExit
Gui, Add, Progress, x110 y90 w20 h30 cGreen vProgC, 0

Gui, Add, Text, x10 y130 w100 h20 , Magicami
Gui, Add, Button, x10 y150 w100 h30 gArenaRepeat, ArenaRepeat
Gui, Add, Progress, x110 y150 w20 h30 cGreen vProgD, 0
Gui, Add, Button, x130 y150 w100 h30 gCheckFail, CheckFail
Gui, Add, Progress, x230 y150 w20 h30 cGreen vProgD2, 0

Gui, Add, Button, x10 y190 w100 h30 gTimer, Timer
Gui, Add, Progress, x110 y190 w20 h30 cGreen vProgE, 0

Gui, Add, Text, x10 y220 w100 h20 , TroubleShooting
Gui, Add, Button, x10 y240 w100 h30 gTSS, TakeScreenShot
Gui, Add, Progress, x110 y240 w40 h30 cGreen vProgB, 0
Gui, Add, Button, x260 y140 w40 h30 gTest, Test
Gui, Add, Button, x260 y170 w40 h30 gTest2, Test2
Gui, Add, Edit, x10 y280 w300 h20 vStatA ReadOnly, Inactive
Gui, Add, Edit, x10 y300 w300 h20 vStatB ReadOnly, Inactive
; Generated using SmartGUI Creator 4.0
Menu, Main, Add, Pause, Pause2
Gui, Menu, Main
Gui, Show, X%TWinX% Y%TWinY% Autosize, %TitleGUI%


if not WinExist(WINID)
{
	MsgBox % "Magicami window not detected, things may break."
}

^Escape::ExitApp

#Include Hotkeys.ahk	;test-hotkeys

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
return

Fishing2:
return


FriendExit:
return

FriendExit2:
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
return

RepeatQ2:
return

FinishQ:
	Toggle := !Toggle
	if (Toggle)
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
	GuiControl,, StatB, % "FinishQ2 i:" i++ " Stage:" RepeatStage " Clicks:" ClickCount

	RandSleep(1,699)
	if (Toggle)  
		SetTimer, FinishQ2, %RepeatPeriod%
return

ArenaRepeat:
	ArenaToggle := !ArenaToggle
	if (ArenaToggle)
	{
		GuiControl,, ProgD, 100
		RepeatStage := 2, i := 0, ClickCount := 0, Timed := A_TickCount
		RepeatPeriod := RepeatPeriodMax
		MsgBox, 3,, Auto?
		IfMsgBox Yes
			ArenaAuto := 1
		IfMsgBox No
			ArenaAuto := 0
		SetTimer, ArenaRepeat2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgD, 0
		SetTimer, ArenaRepeat2, Off
		GuiControl,, StatB, % "Inactive"
		GuiControl,, Iter, % "Iter: " 0
		Timed := (A_TickCount - Timed)/1000
		Timedm := Floor(Timed/60)
		Timeds := Round(Mod(Timed,60))
		GuiControl,, StatA, ArenaRepeatDone Timed:%Timedm%m%Timeds%s
	}
return

ArenaRepeat2:

	if(CheckStartBattle(RepeatStage)==1)
	{
		RepeatPeriod := RepeatPeriodMax
	}
	if(CheckAuto(RepeatStage,ArenaAuto)==1)
	{
		RepeatCount++
	}
	if(CheckWhiteNext(RepeatStage)==1)
	{
		;RepeatPeriod := RepeatPeriodMin
	}
	if(CheckNextBattle(RepeatStage)==1)
	{
		Sleep 5000
		MsgBox, 3,, Continue with Auto?
		IfMsgBox Yes
			ArenaAuto := 1
		IfMsgBox No
			ArenaAuto := 0
		IfMsgBox Cancel
			Gosub, ArenaRepeat
	}

	GuiControl,, StatB, % "ArenaRepeat2 i:" i++ " Stage:" RepeatStage " Clicks:" ClickCount
	

	if (ArenaToggle)  
		SetTimer, ArenaRepeat2, %RepeatPeriod%
return

CheckFail:
	Toggle := !Toggle
	if (Toggle)
	{
		GuiControl,, ProgD2, 100
		i := 0, k := 1, ClickCount := 0
		RepeatPeriod := 9300
		SetTimer, CheckFail2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgD2, 0
		SetTimer, CheckFail2, Off
		GuiControl,, StatA, % "Inactive"
		GuiControl,, StatB, % "Inactive"
	}
return

CheckFail2:
	GuiControl,, StatB, % "CheckFail " i++ " Count: " k " Click: " ClickCount

	if(CheckRepeatFail())
		k++

	if (Toggle)  
	{
		Random, rand, 0, 1000
		RRP := RepeatPeriod + rand
		SetTimer, CheckFail2, %RRP%
	}
return

Timer:

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

RemoveToolTip:
	ToolTip
return


Test:
	WinActivate, ahk_id %uid%
return

Test2:
	MsgBox, 4,, Continue with Auto?
	IfMsgBox Yes
		MsgBox, Yes
	else
		MsgBox, No
return

Pause::Pause

Initialize()
{
	global
	uid := WinExist(WINID)
	Toggle := 0
	ArenaToggle := 0
	FishingToggle := 0
	FriendToggle := 0
	RepeatPeriodMin := 1200
	RepeatPeriodMax := 5000
	Class := 0
	ClickDelay := 50
	ecc := -15
	ClickCount := 0
	WinGetPos,,,WinWidth,WinHeight,%WINID%
	tssi := 1
}

GuiClose:
	WinGetPos,TWinX,TWinY
	IniWrite,%TWinX%,ConfigMC.ini,Variables,LastXS
	IniWrite,%TWinY%,ConfigMC.ini,Variables,LastYS
	IniWrite,%IntervalV1%,ConfigMC.ini,Variables,IntervalV1
	IniWrite,%IntervalV2%,ConfigMC.ini,Variables,IntervalV2
	IniWrite, %Repeat%, ConfigMC.ini, Variables, Repeat
ExitApp