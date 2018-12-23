
F1::
	FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
return

F2::
	;MsgBox % GImageSearch("NewFile",50,,,,,,0)
	ta := StrSplit(IGImageSearch("Maps\1_6\Heli2",,,,,,3),",")
	MouseMove, ta[1], ta[2]
return

F3::
	;ta := StrSplit(GImageSearch("RepairSelect",40),",")
	ta := StrSplit(WGImageSearch("Maps\4_6\Enemy1",,5,540,,,304,3),",")
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return

