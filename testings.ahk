
F1::
	;FindClick()
	;IGImageSearch("DollList\" Doll2,40)
	;MsgBox %  ti.length() "," ts.length() "," ta.length()
	;MouseMove, DepNightC[1], DepNightC[2]
	FriendStandby([96, 163],18)
return

F2::
	;MsgBox % GImageSearch("NewFile",50,,,,,,0)
	ta := StrSplit(IGImageSearch("Maps\4_3e\ChkZoomed",,,,,,3),",")
	MouseMove, ta[1], ta[2]
return

F3::
	;MsgBox % !WGImageSearch("Maps\4_3e\ChkZoomed",,0,,,,,3)
	ta := StrSplit(WGImageSearch("Maps\6_6\ChkZoomed",1,0,,,,,3),",")
	MouseMove, ta[1], ta[2]
return

F4::
	MouseGetPos, tx, ty
	tc := AeroGetPixel(tx,ty)
	FileAppend, %tx% %ty% %tc%`n, MousePosFile.txt
return

