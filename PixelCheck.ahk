;PixelCheck v1.51230

StripARGB(ARGB)
{
	RGB := ARGB & 0x00ffffff
	return RGB
}


DEC2HEX(DEC, ARGB="false")
{
	SetFormat, IntegerFast, hex
	RGB += DEC ;Converts the decimal to hexidecimal
	if(ARGB=="true")
		RGB := RGB & 0x00ffffff
	SetFormat, IntegerFast, d
	return RGB
}

DEC2HEX2(DEC, ARGB="false")
{
    
	RGB := Format("0x{:X}",DEC) ;Converts the decimal to hexidecimal
	if(ARGB=="true")
		RGB := RGB & 0x00ffffff
	
	return RGB
}


AeroGetPixel(x, y, z := 0)	;returns converted bgr -> rgb
{
	global uid
	i := 0
	lHEX := 0
	Loop
	{
		hDC := DllCall("user32.dll\GetDCEx", "Ptr", uid, "UInt", 0, "UInt", 1|2)
		bgr := DllCall("gdi32.dll\GetPixel", "Ptr", hDC, "Int", x, "Int", y, "UInt")
		if (bgr = lHEX)
		{
			i += 1
		}else
		{
			lHEX := bgr
			i := 1
		}
		DllCall("user32.dll\ReleaseDC", "Ptr", uid, "Ptr", hDC)
		DllCall("gdi32.dll\DeleteDC", "Ptr", hDC)
		Sleep 100
	}until i > z

	return Format("0x{:06X}", ((lHEX & 0xff0000) >> 16) | (lHEX & 0xff00) | ((lHEX & 0xff) << 16))
}

/* unused
PixelGetColorS(x,y,z := 0)
{
	global uid
	i := 0
	lHEX := 0
	;WinActivateRestore()
	Loop
	{
		pToken  := Gdip_Startup()
		pBitmap := Gdip_BitmapFromHWND(uid)
		pARGB := GDIP_GetPixel(pBitmap, x, y)
		pHEX := StripARGB(pARGB)	;used to be DEC2HEX
		if (pHEX = lHEX)
		{
			i += 1
		}else
		{
			lHEX := pHEX
			i := 1
		}
		Gdip_DisposeImage(pBitmap)
		Gdip_Shutdown(pToken)
		Sleep 100
	}Until i > z
	return lHEX
}
*/

;check xy,what color you want,click(optional) here until color
;pc is array of colors to check for, return index of value found
;parameter ecc > 5 if PixelColor MUST be found
;average one check per 750ms
ClickUntilPixelColor(xyc, ecc := 0, clxy := 0, rx := 5, ry := 0)
{
	global uid
	global ECPC
	global ClickCount
	i := 0,	tpc := 0, timeout := 30
	clxy := clxy ? clxy : [-1,-1]
	loop
	{
		RandSleep(50,100)
		tpc := AeroGetPixel(xyc[1],xyc[2],2)
		For k,v in xyc
		{
			if (k>2 and tpc = xyc[3])
			{
				;Sleep 500
				return k-2
			}
			if (tpc = ECPC)
				ecc += 1
			if (clxy[1] != -1 and clxy[2] != -1)
			{
				GuiControl,, StatA, PixelColor still not found - Clicking %ClickCount%
				if ry
					RCtrlClick(clxy,rx,ry)
				else
					RCtrlClick(clxy,rx)
			}
		}
		RandSleep(450,500)
		i += 1
	} Until i > timeout
	if ecc > 5
	{
		tpc := DEC2HEX2(xyc[3])
		GuiControl,, StatA, % "ErrorCat CUPC " xyc[1] " " xyc[2] " " tpc
		MsgBox Error Exit
		Exit
	}
	return 0
}

;check until pixel is color, then (optional)click
;xyc is array of x,y,colors.. to check for, return index-2 of value found
;parameter ecc > 5 if PixelColor MUST be found
;exactly two checks per second
WaitForPixelClick(xyc, ecc := 0, clxy := 0, rx := 5, ry := 0)
{
	global uid
	global ECPC
	global ClickCount
	i := 0,	tpc := 0, timeout := 60
	clxy := clxy ? clxy : [-1,-1]
	loop
	{
		tpc := AeroGetPixel(xyc[1],xyc[2],1)
		For k,v in xyc
		{
			if (k>2 and tpc = v)
			{
				if (clxy[1] != -1 and clxy[2] != -1)
				{
					
					RandSleep(1,200)
					if ry
						RCtrlClick(clxy,rx,ry)
					else
						RCtrlClick(clxy,rx)
				}
				GuiControl,, StatA, PixelFound %ClickCount%
				return k-2
			}
		}
		if (tpc = ECPC)
			ecc += 1
		Sleep 400
		i += 1
	} Until i > timeout
	if ecc > 5
	{
		tpc := DEC2HEX2(xyc[3])
		GuiControl,, StatA, % "ErrorCat WFPC " xyc[1] " " xyc[2] " " tpc
		MsgBox Error Exit
		Exit
	}
	return 0
}