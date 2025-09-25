
;SetControlDelay, 0

CtrlClick(xy)
{

	global uid, WINID, ClickDelay, ClickCount
	WinGetPos,,,WinWidth,WinHeight,%WINID%

	Sleep ClickDelay

	;if Class = 0

	if (xy[1]<0 or xy[1]>WinWidth or xy[2]<30 or xy[2]>WinHeight)
	{
		GuiControl,, StatA, % "CClick tried to click OOB! " xy[1] " " xy[2] " " ClickCount
		MSgBox Error Exit
		Exit
	}
	BlockInput On
	ControlClick, % "x" xy[1] " y" xy[2], ahk_id %uid%,,,,NA Pos
	BlockInput Off
	;else
	;	ControlClick, %Class%,ahk_id %uid%,,,, % "x" xy[1] " y" xy[2]


	SoundPlay, %A_WinDir%\Media\ding.wav
	FileAppend, % "Clicking x" xy[1] " y" xy[2] "`n", TroubleLog.txt
	ClickCount++
	return

}

RCtrlClick(xy, r, r2 := 0)
{

	global uid, WINID, ClickDelay, ClickCount
	WinGetPos,,,WinWidth,WinHeight,%WINID%
	Sleep ClickDelay


	x := xy[1], y := xy[2]	;need temp vars for Rand byrefs to work

	if (r2) 
		RandRect(x,y,r,r2)
	else 
		RandCircle(x,y,r)

	if (x<1 or x>WinWidth or y<30 or y>WinHeight)
	{
		GuiControl,, StatA, RCClick tried to click out of bounds! %x% %y% %ClickCount%
		MSgBox Error Exit %WinWidth% %WinHeight%
		Exit
	}
	;BlockInput On
	ControlClick, x%x% y%y%, ahk_id %uid%,,,,NA Pos
	;BlockInput Off
	;else
	;	ControlClick, %Class%,ahk_id %uid%,,,, x%x% y%y%
	FileAppend, Clicking x%x% y%y%`n, TroubleLog.txt
	SoundPlay, %A_WinDir%\Media\ding.wav
	ClickCount++
	return

}

RCtrlClickCS(xy, r, r2 := 0)
{

	global uid, WINID, ClickDelay, ClickCount
	WinGetPos,,,WinWidth,WinHeight,%WINID%
	Sleep ClickDelay


	X := xy[1], Y := xy[2]	;need temp vars for Rand byrefs to work

	if (r2) 
		RandRect(X,Y,r,r2)
	else 
		RandCircle(X,Y,r)

	if (X<1 or X>WinWidth or Y<1 or Y>WinHeight)
	{
		GuiControl,, StatA, RCClick tried to click out of bounds! %X% %Y% %ClickCount%
		MSgBox Error Exit %WinWidth% %WinHeight%
		Exit
	}

  	hwnd:= uid ;ControlFromPoint(X, Y, WinTitle, WinText, cX, cY, ExcludeTitle, ExcludeText)  
  	PostMessage, 0x200, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_MOUSEMOVE
  	PostMessage, 0x201, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDOWN  
 	PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP  

	FileAppend, Clicking x%X% y%Y%`n, TroubleLog.txt
	SoundPlay, %A_WinDir%\Media\ding.wav
	ClickCount++
	return

}
/*
RFindClick(x,y, r := 5, xoff :=0, yoff := 0)
{
	local tx := 0, ty := 0, temp, ta
	GuiControl,, StatA, %x%
	RandCircle(tx,ty,r)
	tx += xoff
	ty += yoff
	temp := FindClick(A_ScriptDir "\pics\" x,y " x"tx " y"ty)
	;ta := StrSplit(temp,",")
	
	GuiControl,, StatA, %x% %tx% %ty% %temp%
	if (temp != 0)
		SoundPlay, %A_WinDir%\Media\ding.wav
	return temp
}

WFindClick(x,y, SearchNumber := 40)
{
	global
	local tx, ty, wx, wy, tstr
	GuiControl,, StatA, %x% %ClickCount%
	Found := 0
	Found := FindClick(A_ScriptDir "\pics\" x,y " rNoxPlayer mc o"SearchNumber " n0")
	while found == 0
	{
		SearchNumber += 6
		Found := FindClick(A_ScriptDir "\pics\" x,y " rNoxPlayer mc o"SearchNumber " n0")
		GuiControl,, StatA, NotFound pixel shade offset [%SearchNumber%]
		If SearchNumber >= 200
		{
			GuiControl,, StatA, WFindClick failed %x% %ClickCount%
			Exit
		}
	}
	WinGetPos, wx, wy,,, NoxPlayer
	tstr := StrSplit(Found,",")
	tx := tstr[1] - wx
	ty := tstr[2] - wy
	MouseMove, tx, ty
	GuiControl,, StatA, %x% Found offset [%SearchNumber%] %tx% %ty%
	;FindClick(A_ScriptDir "\pics\" x, y "Center x" RandX " y"  RandY " o" SearchNumber)
	return Found
}
*/