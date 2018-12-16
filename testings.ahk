
F1::
	FindClick()
return

F2::
	MsgBox % GImageSearch("RepairSelect",50,,,,,,0)
	;IGImageSearch("Maps\4_3e\Enemy4",,,,,,7)
return

F3::
	;ta := StrSplit(GImageSearch("RepairSelect",40),",")
	ta := IGImageSearch("Maps\4_3e\Heli2",0)
	;GuiControl,, StatA, % ta[1] " " ta[2]
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return
