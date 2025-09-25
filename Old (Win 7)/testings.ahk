
F6::
	MouseGetPos, tx, ty
	txx := tx + NormalRand(-25,25)
	tyy := ty + NormalRand(-25,25)
	MouseMove, txx, tyy
	Click 
	RandSleep(205,425)
return

#If WinExist("ahk_exe Nox.exe")
^F1::
	FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
	
return

^F2::
	;Map_Execute()
	;IGImageSearch("Maps\0_2\ChkZoomed")
	;MsgBox % GImageSearch("LoadScreen")
	;MsgBox, % RescueFairy()
	;LookForClickClose(2)
	MsgBox, % GImageSearch("CastOut",10)
return

^F3::
	;MsgBox % !WGImageSearch("Maps\4_3e\ChkZoomed",,0,,,,,3)
	;ta := StrSplit(WGImageSearch("Maps\3_6\Boss",,5,,,,,1),",")
	;MouseMove, ta[1], ta[2]
	n := 146, color := 0x3A6C3C
	while(n<612)
	{
		if(PixelNot([n,426,color]))
			MsgBox, repair needed
		n := n + 116
	}
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, `[%tx%`, %ty%`] %tc%`]`n, MousePosFile.txt
return

^F4::
	MouseMove, tx, ty
return