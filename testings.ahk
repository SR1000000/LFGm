
F6::
	MouseGetPos, tx, ty
	txx := tx + NormalRand(-7,7)
	tyy := ty + NormalRand(-7,7)
	Click, %txx% , %tyy%
	MouseMove, tx, ty
	RandSleep(95,125)
return

#If WinExist("ahk_exe Nox.exe")
F1::
	;FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
	MsgBox % RescueFairy()
return

F2::
	;MsgBox % GImageSearch("NewFile",50,,,,,,0)
	;ta := StrSplit(IGImageSearch("DollList\Type95b",,,,,,3),",")
	ta := [1,3]
	tb := 0
	if(ta)
		MsgBox TA
	if(tb)
		MsgBox TB
return

F3::
	;MsgBox % !WGImageSearch("Maps\4_3e\ChkZoomed",,0,,,,,3)
	ta := StrSplit(WGImageSearch("Maps\5_6\Boss",,5,,,,,1),",")
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, `[%tx%`, %ty%`] %tc%`]`n, MousePosFile.txt
return
