
F1::
	;FindClick()
	;GuiControl,, StatA, %ClickCount%
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox % StrSplit(WGImageSearch("CloseButton",1),",").Length()
return

F2::
	;MsgBox % GImageSearch("NewFile",50,,,,,,0)
	ta := StrSplit(IGImageSearch("CloseButton",,,,,,6),",")
	MouseMove, ta[1], ta[2]
return

F3::
	;ta := StrSplit(GImageSearch("RepairSelect",40),",")
	ta := StrSplit(GImageSearch("Maps\1_6\Enemy1",25,,,,,6),",")
	GuiControl,, StatA, % ta[1] " " ta[2]
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return

