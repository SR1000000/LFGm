
F1::
	FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
return

F2::
	;MsgBox % GImageSearch("NewFile",50,,,,,,0)
	;ta := StrSplit(IGImageSearch("Maps\4_3e\ChkZoomed",,,,,,3),",")
	ta := [589, 457]
	MouseMove, ta[1], ta[2]
return

F3::
	;MsgBox % !WGImageSearch("Maps\4_3e\ChkZoomed",,0,,,,,3)
	ta := StrSplit(WGImageSearch("Maps\1_6\BlueRef",1,0,,,,,1),",")
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return

