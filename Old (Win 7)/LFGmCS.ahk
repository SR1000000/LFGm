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
#Include FunctionsCS.ahk
#Include FunctionsBD.ahk
#Include PixelCheck.ahk
#Include PixelConstantsCS.ahk
#Include PixelConstantsBD.ahk
#Include RandomFunctions.ahk
#Include Search.ahk

if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

IniRead, WINID, configCS.ini, Variables, WINID, 0

IniRead, CSTitle, ConfigCS.ini, Variables, CSTitle, 0

IniRead, TitleGUI, ConfigCS.ini, Variables, TitleGUI, 0

IniRead, TWinX, ConfigCS.ini, Variables, LastXS, 0

IniRead, TWinY, ConfigCS.ini, Variables, LastYS, 0
IniRead, IntervalV1, ConfigCS.ini, Variables, IntervalV1, 0
IniRead, IntervalV2, ConfigCS.ini, Variables, IntervalV2, 0
IniRead, WorldV, ConfigCS.ini, Variables, WorldSwitcher 
IniRead, CorpseDragV, ConfigCS.ini, Variables, CorpseDragV, 0
IniRead, Repeat, ConfigCS.ini, Variables, Repeat, 1
IniRead, Carry43e, ConfigCS.ini, Variables, Carry43e, ""
IniRead, Carry02, ConfigCS.ini, Variables, Carry02, ""
IniRead, Carry32n, ConfigCS.ini, Variables, Carry32n, ""

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

Gui, Add, Text, x10 y130 w100 h20 , CS Functions
Gui, Add, Button, x10 y150 w100 h30 gSimDaily, SimDaily
Gui, Add, Progress, x110 y150 w20 h30 cGreen vProgD, 0
Gui, Add, Button, x130 y150 w100 h30 gSideDaily, SideDaily
Gui, Add, Progress, x230 y150 w20 h30 cGreen vProgD2, 0

Gui, Add, Button, x10 y190 w100 h30 gGauntletDaily, GauntletDaily
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
	MsgBox % "CS window not detected, things may break."
else
{
	WinMove, %CSTitle%,,,,1600,900
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

FriendExit:
	FriendToggle := !FriendToggle
	if (FriendToggle)
	{
		;FriendStage := 0
		ClickCount := 0
		NumChecks := 1
		GuiControl,, ProgC, 100
		SetTimer, FriendExit2, 5000
	} else
	{
		GuiControl,, ProgC, 0
		GuiControl,, StatB, Inactive
		SetTimer, FriendExit2, Off
	}
return

FriendExit2:

	GuiControl,, StatB, FriendExit Engaged %FriendStage%, Clicks: %ClickCount%, Checks: %NumChecks%
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
		IniWrite, %Repeat%, ConfigCS.ini, Variables, Repeat
		RepeatPeriod := RepeatPeriodMin
		RepeatStage := 2
		ResultNext := 0, StartNext := 0, MissionStartNext := 0
		TimeOfLastResult := A_TickCount/1000
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
		GuiControl,, StatA, RepeatDone Timed:%Timedm%m%Timeds%s
	}
return

RepeatQ2:
	GuiControl,, StatB, % "RepeatQ2 i:" i++ " Stage:" RepeatStage " Clicks:" ClickCount

	GuiControl,, Iter, % "Iter: " RepeatCount
	MouseMove, 1, 1, 0, R
   	 ; Replace mouse to its original location
    	MouseMove, -1, -1, 0, R

	if (RPQToggle)  
	{
		Random, rand, 0, 500
		RRP := RepeatPeriod + rand
		SetTimer, RepeatQ2, %RRP%
	}
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
	{
		Random, rand, 0, 500
		RRP := RepeatPeriod + rand
		SetTimer, FinishQ2, %RRP%
	}
return

SimDaily:
	SimToggle := !SimToggle
	if (SimToggle)
	{
		GuiControl,, ProgD, 100
		RepeatCount := 0, i := 0, ClickCount := 0, Timed := A_TickCount
		RCtrlClickCS(MenuSelect,35)
		RandSleep(700,1000)
		RCtrlClickCS(MenuOperation,45)
		RandSleep(700,1000)
		RCtrlClickCS(OperationSim,40)
		Gosub, SimDaily2
		Gosub, SimDaily
	} else
	{
		GuiControl,, ProgD, 0
		SetTimer, SimDaily2, Off
		GuiControl,, StatB, % "Inactive"
		Timed := (A_TickCount - Timed)/1000
		Timedm := Floor(Timed/60)
		Timeds := Round(Mod(Timed,60))
		GuiControl,, StatA, SimDailyDone Timed:%Timedm%m%Timeds%s
	}
return

SimDaily2:
	GuiControl,, StatB, % "SimDaily2 i:" i++ " Stage:" RepeatStage " Clicks:" ClickCount
	
return

SideDaily:
	SideToggle := !SideToggle
	if (SideToggle)
	{
		GuiControl,, ProgD2, 100
		i := 0, k := 1, ClickCount := 0
		RepeatPeriod := 5300
		SetTimer, SideDaily2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgD2, 0
		SetTimer, SideDaily2, Off
		GuiControl,, StatA, % "Inactive"
		GuiControl,, StatB, % "Inactive"
	}
return

SideDaily2:
	GuiControl,, StatB, % "SideDaily " i++ " Count: " k " Click: " ClickCount


	if (SideToggle)  
	{
		Random, rand, 0, 500
		RRP := RepeatPeriod + rand
		SetTimer, SideDaily2, %RRP%
	}
return


GauntletDaily:
	GauntletToggle := !GauntletToggle
	if (GauntletToggle)
	{
		GuiControl,, ProgE, 100
		i := 0, k := 1, ClickCount := 0
		RepeatPeriod := 5300
		SetTimer, GauntletDaily2, %RepeatPeriod%
	} else
	{
		GuiControl,, ProgE, 0
		SetTimer, GauntletDaily2, Off
		GuiControl,, StatA, % "Inactive"
		GuiControl,, StatB, % "Inactive"
	}
return

GauntletDaily2:
	GuiControl,, StatB, % "GauntletDaily " i++ " Count: " k " Click: " ClickCount


	if (SideToggle)  
	{
		Random, rand, 0, 500
		RRP := RepeatPeriod + rand
		SetTimer, GauntletDaily2, %RRP%
	}
return

TSS:
	If !pToken := Gdip_Startup()
	{
	   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	   Exit
	}
	pHaystack := Gdip_BitmapFromHWND(uid)
	temp := Gdip_SaveBitmapToFile(pHaystack, "D:\TSS" . tssi . ".png")
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
	
return

Test2:
	DoThisUntilThat("RCtrlClick","PixelIs",,1,,2,3)
return

Pause::Pause

Initialize()
{
	global
	uid := WinExist(WINID)
	Toggle := 0
	SimToggle := 0
	SideToggle := 0
	GauntletToggle := 0
	FriendToggle := 0
	RepeatPeriodMin := 1000
	RepeatPeriodMid := 3000
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
	IniWrite,%TWinX%,ConfigCS.ini,Variables,LastXS
	IniWrite,%TWinY%,ConfigCS.ini,Variables,LastYS
	IniWrite,%IntervalV1%,ConfigCS.ini,Variables,IntervalV1
	IniWrite,%IntervalV2%,ConfigCS.ini,Variables,IntervalV2
	IniWrite, %Repeat%, ConfigCS.ini, Variables, Repeat
ExitApp