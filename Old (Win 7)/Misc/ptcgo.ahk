#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

RandClick(x,y) {
	Random, xr, -5, 5
	Random, yr, -5, 5
	xr := xr+x
	yr := yr+y
	Click %xr%, %yr%
	Sleep 100
}

RandXY(x,y) {
	global rx
	global ry
	Random, rx, -3, 3
	Random, ry, -3, 3
	rx := rx+x
	ry := ry+y
}


*LButton::  
	akey := 0
	If (A_PriorHotKey && A_TimeSincePriorHotkey < 40) 
		Return
	If (GetKeyState("Ctrl"))	{
		Send ^{LButton Down}
	} else if (GetKeyState("Shift")) {
		Send +{LButton Down}
	} else {
		Send {LButton Down}
	}
	KeyWait LButton     ;physical state
	Send {LButton Up}
	Return

*LButton up::
	If (A_TimeSinceThisHotkey < 40) 
		Return
	Send {LButton Up}
	Return

F6::
	Click
	Sleep 150
return

;NumpadEnter::
;	Click
;return

;F8::
;    if( not GetKeyState("LButton" , "P") )
;        Click down
;return
;
;F8 Up::Click up
;return


#If WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe explorer.exe")

^q::
	Send !{Left}
return

^e::
	Send !{Right}
return

F7::
	MouseClick Right
	Sleep 150
	Send v
	Sleep 350
	Send {Enter}
	Sleep 200
	Send ^w
return


x := 150

#If WinActive("ahk_exe Pokemon Trading Card Game Online.exe")

!^q::
	RandClick(1000, 100)
	Sleep x
	RandClick(600, 390)
	Sleep x
return

!^w::
	RandClick(650, 450)
	Sleep x+50
	RandClick(1000, 390)
	Sleep x
	Send prism
	Sleep x+100
	Send {Enter}
	Sleep x+300
	;RandClick(520, 643)
	MouseMove 520, 643
return

!^r::
	RandClick(650, 450)
	Sleep x+50
	RandClick(1000, 390)
	Sleep x
	Send guar
	Sleep x+100
	Send {Enter}
	Sleep x+200
	MouseMove 520, 643
	Sleep x+300
	RandClick(520, 643)
return

!^e::
	RandClick(950, 100)
	Sleep x+50
	RandClick(520, 400)
	Sleep x+50
	RandClick(640, 500)
	Sleep x
return

!^s::
	RandClick(300, 400)
	Sleep x+230
	RandClick(364, 481)
	Sleep x
	RandClick(730,690)
	Sleep x
return

!^d::
	RandClick(850, 260)
	Sleep x+400
	
	RandClick(650, 450)
	Sleep x
	RandClick(1000, 390)
	Sleep x
	Send prism
	Sleep x+100
	Send {Enter}
	Sleep x+300
	;RandClick(516, 643)
	MouseMove 516, 643
return

!^g::
	RandClick(850, 260)
	Sleep x+400
	
	RandClick(650, 450)
	Sleep x
	RandClick(1000, 390)
	Sleep x
	Send guar
	Sleep x+100
	Send {Enter}
	Sleep x+200
	MouseMove 516, 643
	Sleep x+300
	RandClick(516, 643)
return


!^x::
	RandClick(650, 450)
	Sleep x
	RandClick(1000, 390)
	Sleep x
	Send che
	Sleep x+100
	Send {Enter}
	Sleep x+300
	RandClick(860, 643)
	MouseMove 892, 643
return

!^c::
	RandClick(400, 444)
	Sleep x
	RandClick(300, 400)
	Sleep x+200
	RandClick(230, 420)
	Sleep x
	RandClick(730, 575)
return

!^f::
	RandClick(520, 444)
	Sleep x
	RandClick(294, 395)
	Sleep x+150
	RandClick(230, 390)
	Sleep x
	RandClick(729, 535)
return

#If WinActive("ahk_exe dlpc.exe")

^Space::
	MouseGetPos, sx, sy
	RandClick(820,380)
	MouseMove, sx, sy
return

~*Space::
	MouseGetPos, sx, sy
	RandClick(875,485)
	MouseMove, sx, sy
return


z::
	MouseGetPos, sx, sy
	RandClick(405,640)
	MouseMove, sx, sy
return

x::
	MouseGetPos, sx, sy
	RandClick(640,705)
	MouseMove, sx, sy
return
