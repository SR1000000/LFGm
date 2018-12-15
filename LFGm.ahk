/*
	GUI for me nox macros
	MUST BE RUN -AFTER- NOX IS LOADED
*/
#NoEnv
#Persistent
#SingleInstance
#Include Click.ahk
#Include Drag.ahk
#Include FindClick.ahk
#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk
#Include Maps.ahk
#Include PixelCheck.ahk
#Include PixelConstants.ahk
#Include PixelSearch.ahk
#Include RandomFunctions.ahk
;#Include Windows.ahk

IniRead, WINID, config.ini, Variables, WINID, 0

IniRead, CSTitle, config.ini, Variables, CSTitle, 0

IniRead, TWinX, config.ini, Variables, LastXS, 0

IniRead, TWinY, config.ini, Variables, LastYS, 0
IniRead, IntervalV1, config.ini, Variables, IntervalV1, 0
IniRead, IntervalV2, config.ini, Variables, IntervalV2, 0
IniRead, WorldV, config.ini, Variables, WorldSwitcher 

Menu, Tray, Icon, %A_ScriptDir%/favicon_ahkcsortie.ico,,1
CoordMode, Pixel, Relative


Initialize()


Gui, 1: New
Gui, 1: Default
Gui, Add, Text, x10 y10 w50 h20 , Routine:
Gui, Add, DropDownList, x60 y10 w60 h20 r5 Choose3 gWorldNotes vWorldV, 4-3E|5-2E|0-2|3-2N Solo|3-2N|5-2N
GuiControl, ChooseString, WorldV, %WorldV%
Gui, Add, Text, x130 y10 w40 h20 , Repeat:
Gui, Add, Edit, x170 y10 w50 h20 Number vRepeat -VScroll, 1
Gui, Add, Button, x230 y10 w100 h20 gExecuteF vExecute, Execute
Gui, Add, Progress, x230 y40 w100 h20 cGreen vProgA, 0
Gui, Add, Text, x10 y40 w60 h20 , Interval1(s):
Gui, Add, Text, x10 y60 w60 h20 , Interval2(s):
Gui, Add, Edit, x70 y40 w60 h20 Number vIntervalV1 gIntervalF1 -VScroll, %IntervalV1%
Gui, Add, Edit, x70 y60 w60 h20 Number vIntervalV2 gIntervalF2 -VScroll, %IntervalV2%
Gui, Add, Text, x150 y38 w50 h20 vIter, Iter: 0
Gui, Add, Text, x140 y56 w100 h40 vNotes, % MapNotes(WorldV)
Gui, Add, Edit, x10 y110 w320 h20 vStatA ReadOnly, Inactive
Gui, Add, Text, x10 y150 w100 h20 , Tales of Erin
Gui, Add, Button, x10 y170 w100 h30 gDivin, Repeat Divinity
Gui, Add, Progress, x110 y170 w40 h30 cGreen vProgB, 0
Gui, Add, Button, x150 y170 w100 h30 gMBJoin, MB Join
Gui, Add, Progress, x250 y170 w40 h30 cGreen vProgC, 0
Gui, Add, Button, x290 y170 w40 h30 gTest, Test
Gui, Add, Edit, x10 y210 w320 h20 vStatB ReadOnly, Inactive
; Generated using SmartGUI Creator 4.0
Menu, Main, Add, Pause, Pause2
Gui, Menu, Main
Gui, Show, X%TWinX% Y%TWinY% Autosize, Macros

if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

if not WinExist(WINID)
{
	MsgBox % "Nox window not detected, things may break."
}

^Escape::ExitApp

F1::
	;RepairCheck()
	;FindClick()
	tx:=0,ty:=0
	temp := GPixelSearch(0xF93646,,,,,,,0) ;0x919599 = 1
	ta := StrSplit(temp,",")
	tx := ta[1]
	ty := ta[2]
	MsgBox % temp
	MouseMove, tx, ty
return

F2::
	;MsgBox % FindClick(A_ScriptDir "\pics\NewFile", " rNoxPlayer mc o20 w5000,50 n0")
	MsgBox % isObject(GImageSearch("NewFile",,,,,,,0))
return

F3::
	;WFindClick("NewFile"," rNoxPlayer mc",0)
	MsgBox % WGImageSearch("Maps\4_3e\Heli2")
	;MouseMove, DepOkx, DepOky
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return

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
	if DivinToggle	;DivinToggle starts at 0, line above makes it true
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
	Dx := 725
	Dy := 500
	if(AeroGetPixel(745,448,2) = 0xFFFFFF)
	{
		RCtrlClick(Dx,Dy,25)
		NumClicks += 1
		GuiControl,, StatB, Divinity Engaged, Clicks: %NumClicks%
		RandSleep(250,330)
		if(AeroGetPixel(100,139) != 0xE1DDBB)
		{
			RCtrlClick(Dx,Dy,25)
			NumClicks += 1
			GuiControl,, StatB, Divinity Engaged, Clicks: %NumClicks%
		}
	} 
	RandSleep(1,255)

return

MBJoin:
	MBJToggle := !MBJToggle
	if MBJToggle
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
		RCtrlClick(745,215,35,14)
		NumClicks += 1
		RandSleep(430,790)
		if(AeroGetPixel(724,217,2) = 0x226687)
		{
			RCtrlClick(400,382,50,13)
			NumClicks += 1
		}
		GuiControl,, StatB, MBJoin Engaged, Clicks: %NumClicks%
		Random, t, 1500, 5500
		if MBJToggle 
			SetTimer, MBJoin2, %t%
	}
	else if(AeroGetPixel(445,538,2) = 0x04EEFF)
	{
		RCtrlClick(700,500,60)
		NumClicks += 1
		GuiControl,, StatB, MBJoin Engaged, Clicks: %NumClicks%
		if MBJToggle 
			SetTimer, MBJoin2, 500
	} else
		if MBJToggle  
			SetTimer, MBJoin2, 5000
	RandSleep(1,299)
return

Pause2:
	GuiControl,, ProgA, 0
	Pause

return




ExpeditionCheck()
{
	global
	local loopcount := 1, Found := 0
	
	;until two continuous seconds of homepixel true
	while loopcount < 2
	{	
		GuiControl,, StatA, ExpeditionCheck running %ClickCount%
		Sleep 1800
		if (AeroGetPixel(Home[1],Home[2],1) = Home[3])
			loopcount++
		else
		{
			Sleep 100
			GuiControl,, StatA, Clicking away Expeditions
			WaitForPixelClick(Expedx,Expedy,[Expedc],ecc,600,450,150)
			GuiControl,, StatA, Clicking Expeditions OK Button
			WaitForPixelClick(ExpedOKx,ExpedOKy,[ExpedOKc],ecc,ExpedOKx,ExpedOKy,35,15)
			loopcount := 1
		}
	}
	GuiControl,, StatA, ExpeditionCheck Complete %ClickCount%
	return
}


RepairCheck()
{
	global
	ClickCount := 0
	GuiControl,, StatA, RepairCheck running %ClickCount%
	;if AeroGetPixel(RepairEx,RepairEy,1) = RepairEc
	;{
		RCtrlClick(RepairBx,RepairBy,40,15)
		WaitForPixelClick(RepairSl1x,RepairSl1y,[RepairSl1c],10,RepairSl1x,RepairSl1y,15,24)

		GuiControl,, StatA, Clicking Slot1 %ClickCount%
		WaitForPixelClick(31,229,[0xFFBB00],10,Slot1x,Slot1y,38)

		GuiControl,, StatA, Clicking RepairOK %ClickCount%
		Sleep 400
		RCtrlClick(RepairOKx,RepairOKy,44,36)

		GuiControl,, StatA, Clicking RepairQR %ClickCount%
		Sleep 400
		RCtrlClick(RepairQRx,RepairQRy,13)

		GuiControl,, StatA, Clicking RepairOKOK %ClickCount%
		Sleep 300
		RCtrlClick(RepairOKOKx,RepairOKOKy,36,14)

		GuiControl,, StatA, Clicking RepairCP %ClickCount%
		Sleep 400
		RCtrlClick(RepairCpx,RepairCpy,36,14)

		GuiControl,, StatA, Clicking RetHome %ClickCount%
		Sleep 500
		;RCtrlClick(RepairCpOkx,RepairCpOky,5,5) ;inaccurate rx ry
		;Sleep 200
		WaitForPixelClick(RetHomex,RetHomey,[RetHomec],10,RetHomex,RetHomey,RetHomerx,RetHomery)

	;}
	GuiControl,, StatA, RepairCheck Complete %ClickCount%
	;ExpeditionCheck()
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

;SSBF in precursor script
ExecuteF: 
	ClickCount := 0
	i:=0

	GuiControl,, ProgA, 100
	GuiControl, Hide, Execute
	GuiControlGet, WorldV
	IniWrite, %WorldV%, config.ini, Variables, WorldSwitcher
	GuiControlGet, Repeat
	while i < Repeat
	{
		ExpeditionCheck()
		RunMap(WorldV)
		i++
	}
	GuiControl,, StatA, Execute finished %ClickCount%
	GuiControl, Show, Execute
	GuiControl,, ProgA, 0
return


Test:
	RepairCheck()
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
	ecc := 10
	ClickCount := 0
	init_drag()
}

GuiClose:
	WinGetPos,TWinX,TWinY
	IniWrite,%TWinX%,config.ini,Variables,LastXS
	IniWrite,%TWinY%,config.ini,Variables,LastYS
	IniWrite,%IntervalV1%,config.ini,Variables,IntervalV1
	IniWrite,%IntervalV2%,config.ini,Variables,IntervalV2
ExitApp