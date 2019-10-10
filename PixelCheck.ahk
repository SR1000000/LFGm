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
	j := 0
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
		j++
		if(j > 300)
		{
			MsgBox Stuck in AeroGetPixel %x% %y%
			Exit
		}
		Sleep 100
	}until i > z

	return Format("0x{:06X}", ((lHEX & 0xff0000) >> 16) | (lHEX & 0xff00) | ((lHEX & 0xff) << 16))
}

;two functions repackaging AeroGetPixel to work with DoThisUntilThat
;PixelIs returns true if ANY color in the list is matched
;PixelNot returns false if ANY color in the list is matched, true if all unmatched
PixelIs(xyc)
{
	tpc := AeroGetPixel(xyc[1],xyc[2],2)
	For k,v in xyc
	{
		if (k>2 and tpc = v)
		{
			return true
		}
	}
	return false
}
PixelNot(xyc)
{
	tpc := AeroGetPixel(xyc[1],xyc[2])
	For k,v in xyc
	{
		if (k>2 and tpc = v)
		{
			return false
		}
	}
	return true
}

FileGDIP(uid)
{
	pToken  := Gdip_Startup()
	pBitmap := Gdip_BitmapFromHWND(uid)

	MsgBox, % Gdip_SaveBitmapToFile(pBitmap,"GDIPbitmap.png")

	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
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

;check xyc, click(optional) clxy until color
;xyc is array of x,y,colors.. to check for, return index-2 of value found
;Negative WaitFor hard stops if pixel not found, positive WaitFor ignores
;average one check/click per 700ms
ClickUntilPixelColor(xyc, WaitFor := -5, clxy := 0, rx := 5, ry := 0, instant := 0)
{
	global ECPC
	global ClickCount
	i := 0,	tpc := 0, timeout := 30
	clxy := clxy ? clxy : [-1,-1]	;parameters can't default to arrays - workaround
	timeout := Round(Abs(WaitFor) / 0.75)
	tsx := xyc[1], tsy := xyc[2], tsc := DEC2HEX2(xyc[3]), tsx2 := clxy[1], tsy2 := clxy[2]
	instant := instant ? 0 : 1
	FileAppend, CUPC [%tsx% %tsy% %tsc%] [%tsx2% %tsy2%]`n, TroubleLog.txt
	GuiControl,, StatA, CUPC running
	loop
	{
		tpc := AeroGetPixel(xyc[1],xyc[2],instant)	;Can bug out if xyc never stops (ex: circling yellow lines around helipad)
							;Attempted Fix: instant getpixel (Fix reverted)
		GuiControl,, StatA, CUPC running %i% 1
		For k,v in xyc
		{
			if (k>2 and tpc = xyc[k])
			{
				GuiControl,, StatA, % "CUPC PixelColor found, returning, " xyc[1] " " xyc[2] " " ClickCount " " i
				FileAppend, CUPC Color Found`n, TroubleLog.txt
				return k-2
			}
		}
		if (tpc = ECPC) 
			ecc += 1
		if (clxy[1] != -1 and clxy[2] != -1)
		{
			GuiControl,, StatA, % "CUPC PixelColor not found, Clicking, " xyc[1] " " xyc[2] " " ClickCount " " i
			if (ry)
				RCtrlClick(clxy,rx,ry)
			else
				RCtrlClick(clxy,rx)
		}
		RandSleep(643,761)
		i++
	} Until i > timeout
	if (WaitFor<0)
	{
		GuiControl,, StatA, % "ErrorCat CUPC " xyc[1] ", " xyc[2] " " tohex(xyc[3]) " " clxy[1] ", " clxy[2]
		MsgBox Error Exit
		Exit
	}
	return ""
}
;check xyc, click(optional) clxy until xyc not color
;Negative WaitFor hard stops if pixel not found, positive WaitFor ignores
;average one check/click per 700ms
ClickUntilPixelNot(xyc, WaitFor := -5, clxy := 0, rx := 5, ry := 0, instant := 1)
{
	global ECPC
	global ClickCount
	i := 0,	tpc := 0, timeout := 30
	clxy := clxy ? clxy : [-1,-1]	;parameters can't default to arrays - workaround
	timeout := Round(Abs(WaitFor) / 0.75)
	tsx := xyc[1], tsy := xyc[2], tsc := DEC2HEX2(xyc[3]), tsx2 := clxy[1], tsy2 := clxy[2]
	instant := instant ? 0 : 1
	FileAppend, CUPN [%tsx% %tsy% %tsc%] [%tsx2% %tsy2%]`n, TroubleLog.txt
	GuiControl,, StatA, CUPN running
	loop
	{
		tpc := AeroGetPixel(xyc[1],xyc[2],instant)
		GuiControl,, StatA, CUPN running %i% 1
		if (tpc != xyc[3])
		{
			GuiControl,, StatA, % "CUPN Pixel not color anymore, continuing " xyc[1] " " xyc[2] " " ClickCount " " i
			FileAppend, CUPN pixel not anymore`n, TroubleLog.txt
			return
		}
		if (tpc = ECPC) 
			ecc += 1
		if (clxy[1] != -1 and clxy[2] != -1)
		{
			GuiControl,, StatA, % "CUPN Clicking, " clxy[1] " " clxy[2] " " ClickCount " " i
			if (ry)
				RCtrlClick(clxy,rx,ry)
			else
				RCtrlClick(clxy,rx)
		}
		RandSleep(643,761)
		i++
	} Until i > timeout
	if (WaitFor<0)
	{
		GuiControl,, StatA, % "ErrorCat CUPN " xyc[1] ", " xyc[2] " " tohex(xyc[3]) " " clxy[1] ", " clxy[2]
		MsgBox Error Exit
		Exit
	}
	return ""
}

;check until pixel is color, then (optional)click
;xyc is array of x,y,colors.. to check for, return index-2 of value found
;Negative WaitFor hard stops if pixel not found, positive WaitFor ignores
;exactly two checks per second
WaitForPixelClick(xyc, WaitFor := -30, clxy := 0, rx := 5, ry := 0)
{
	global ECPC
	global ClickCount
	i := 0,	tpc := 0, timeout := 60	;30 seconds
	clxy := clxy ? clxy : [-1,-1]
	timeout := Round(Abs(WaitFor) * 2)
	tsx := xyc[1], tsy := xyc[2], tsc := DEC2HEX2(xyc[3]), tsx2 := clxy[1], tsy2 := clxy[2]
	FileAppend, WFPC [%tsx% %tsy% %tsc%] [%tsx2% %tsy2%]`n, TroubleLog.txt
	loop
	{
		tpc := AeroGetPixel(xyc[1],xyc[2],2)
		For k,v in xyc
		{
			if (k>2 and tpc = v)
			{
				if (clxy[1] != -1 and clxy[2] != -1)
				{
					
					RandSleep(1,200)
					if (ry)
						RCtrlClick(clxy,rx,ry)
					else
						RCtrlClick(clxy,rx)
				}
				GuiControl,, StatA, % "WFPC PixelFound " xyc[1] " " xyc[2] " " ClickCount
				return k-2
			}
		}
		if (tpc = ECPC)
			ecc += 1
		Sleep 300
		i += 1
	} Until i > timeout
	if (WaitFor<0)
	{
		tpc := DEC2HEX2(xyc[3])
		GuiControl,, StatA, % "ErrorCat WFPC " xyc[1] ", " xyc[2] " " tohex(xyc[3]) " " clxy[1] ", " clxy[2]
		MsgBox Error Exit
		Exit
	}
	return ""
}

/*
;Check until pixel is not color, then click(optional)
;Negative WaitFor hard stops if pixel not found, positive WaitFor ignores
;exactly one check per 300ms
UntilPixelNotClick(xyc, WaitFor := -30, clxy := 0, rx := 5, ry := 0)
{
	global ClickCount
	i := 0,	tpc := 0, timeout := 60	;30 seconds
	clxy := clxy ? clxy : [-1,-1]
	timeout := Round(Abs(WaitFor) * 2)

	Loop
	{
		tpc := AeroGetPixel(xyc[1],xyc[2],2)
		if (tpc = xyc[3])
		{
			i++
			GuiControl,, StatA, % "Pixel " xyc[1] " " xyc[2] " still " xyc[3] " " ClickCount " " i
		}
		else
		{
			if (clxy[1] != -1 and clxy[2] != -1)
			{
				RandSleep(1,200)
				if (ry)
					RCtrlClick(clxy,rx,ry)
				else
					RCtrlClick(clxy,rx)
			}
			GuiControl,, StatA, % "PixelChanged " xyc[1] " " xyc[2] " " ClickCount
			return 1
		}
		Sleep 100
	} until i > timeout
	if (WaitFor<0)
	{
		tpc := DEC2HEX2(xyc[3])
		GuiControl,, StatA, % "ErrorCat UPNC " xyc[1] " " xyc[2] " " tohex(xyc[3])
		MsgBox Error Exit
		Exit
	}
	return 0
}
*/