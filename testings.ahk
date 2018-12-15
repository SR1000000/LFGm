
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
