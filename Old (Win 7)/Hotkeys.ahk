
F6::
		MouseGetPos, tx, ty
		txx := tx + NormalRand(-25,25)
		tyy := ty + NormalRand(-25,25)
		MouseMove, txx, tyy
		Click 
		RandSleep(205,275)
		MouseMove, tx, ty
return

#If WinActive("ahk_exe dnplayer.exe") || WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe CounterSide.exe")

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, `[%tx%`, %ty%`] %tc%`]`n, MousePosFile.txt
	Clipboard := "[" tx ", " ty "] " tc "]"
return

^F4::
	InputBox, varname
	MouseMove, %varname%[1], %varname%[2]
return


#If WinExist("ahk_exe dnplayer.exe") || WinExist(WINID)
^F1::
	FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
	
return

^F2::
	;StageUnitMoves(2, [2,3], [3,3], [4,1])
	InputBox, varname
	MsgBox, % AeroGetPixel(%varname%[1], %varname%[2])
	;MsgBox, % StrSplit(GImageSearch("Results"),",")
return

^F3::
	;MsgBox % !WGImageSearch("Maps\4_3e\ChkZoomed",,0,,,,,3)
	;ta := StrSplit(WGImageSearch("Maps\3_6\Boss",,5,,,,,1),",")
	;MouseMove, ta[1], ta[2]
	MouseGetPos, tx, ty
	ToolTip, Auto, %tx%, %ty%
return


^+#!F12::ExitApp