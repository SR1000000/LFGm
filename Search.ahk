
GImageSearch(filepath,varia:=0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)
{
	global uid
	if (!filepath)
	{
		MsgBox GIS received empty filepath! Exit
		Exit
	}
	If !pToken := Gdip_Startup()
	{
	   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	   Exit
	}
	pHaystack := Gdip_BitmapFromHWND(uid)
	Gdip_GetImageDimensions(pHaystack, w,h)
	if(xmin>w or xmax>w or ymin>h or ymax>h)
	{
		MsgBox GImageSearch of %filepath% has tried to search out of bounds`n%xmin% %xmax% %ymin% %ymax% > %w% %h%
		Exit
	}
	pNeedle := Gdip_CreateBitmapFromFile(A_ScriptDir "\pics\" filepath ".png")

	Gdip_ImageSearch(pHaystack, pNeedle,list_image,xmin,ymin,xmax,ymax,varia,,searchdir,inst)
	
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
	return list_image	;returns string of coordinates (x,y`n)
}

IGImageSearch(filepath, SearchNumber := 0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)	;incremental
{
	local ta, Found := ""
	GuiControl,, StatA, IGIS %filepath% %ClickCount%
	if (!filepath)
	{
		MsgBox IGIS received empty filepath! Exit
		Exit
	}
	Found := GImageSearch(filepath,SearchNumber,xmin,ymin,xmax,ymax,searchdir,inst)
	while !Found
	{
		SearchNumber += 5
		Found := GImageSearch(filepath,SearchNumber,xmin,ymin,xmax,ymax,searchdir,inst)
		GuiControl,, StatA, NotFound pixel shade offset [%SearchNumber%]
		If (SearchNumber >= 150)
		{
			GuiControl,, StatA, IGImageSearch failed %filepath%
			Exit
		}
	}
	GuiControl,, StatA, IGIS %filepath% Found offset [%SearchNumber%] %Found% 
	return Found
}


;Click until Image found, ensure unique image
;Negative WaitFor hard stops if image not found, positive WaitFor ignores
;Average one click per 600ms
ClickUntilImage(filepath,WaitFor:=-7,clxy:=0,rx:=5,ry:=0,varia:=0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)
{
	global ClickCount
	Found := "", timeout := 30, i := 1
	clxy := clxy ? clxy : [-1,-1]	;parameters can't default to arrays - workaround
	timeout := Round(Abs(WaitFor) / 0.6)

	if (!filepath)
	{
		MsgBox CUI received empty filepath! Exit
		Exit
	}

	loop
	{
		Found := GImageSearch(filepath,varia,xmin,ymin,xmax,ymax,searchdir,inst)
		if (Found != "")
		{
			GuiControl,, StatA, CUI %filepath% found, %Found%
			return Found	
		} else
		{
			GuiControl,, StatA, CUI %filepath% still not found, clicking
			RCtrlClick(clxy,rx,ry)
		}
		RandSleep(500,700)
		i++
	} until i > timeout
	if (WaitFor<0)
	{
		tx := clxy[1], ty := clxy[2]
		GuiControl,, StatA, CUI  %filepath% not found while clicking %tx% %ty%, Exiting
		MsgBox Error Exit
		Exit
	}
	return ""
}

;Wait until image found at same coords for 300ms
;Negative WaitFor hard stops if image not found, positive WaitFor ignores
;Exactly one search every 300ms
WGImageSearch(filepath,WaitFor:=-10,varia:=0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)
{
	global ClickCount
	Found := "", temp := "", timeout := 30, i := 1, j := 0
	timeout := Round(Abs(WaitFor) * 3.3)
	if (!filepath)
	{
		MsgBox WGIS received empty filepath! Exit
		Exit
	}

	loop
	{
		Found := GImageSearch(filepath,varia,xmin,ymin,xmax,ymax,searchdir,inst)
		if (Found != "")
		{
			if (Found == temp)
			{
				j++
				if (j >= 2)
				{
					GuiControl,, StatA, WGIS %filepath% found twice, %Found%
					return temp
				}
			} else
			{
				GuiControl,, StatA, WGIS %filepath% found once, %Found% %temp% %j%
				temp := Found
				j := 1
				i--
			}
		} else
		{
			GuiControl,, StatA, WGIS %filepath% still not found, waiting %Found%
			j := 0
			temp := ""
		}
		if(i < timeout)
			Sleep 300
		
		i++
		
	} until i > timeout
	if (WaitFor<0)
	{
		GuiControl,, StatA, WGIS %filepath% not found, Exiting
		MsgBox Error Exit
		Exit
	}
	GuiControl,, StatA, WGIS %filepath% not found, continuing
	return ""
}

;Recursive to keep finding and clicking Close
LookForClickClose(t)
{
	Closerx := 36
	Closery := 15
	Sleep 200
	ta := StrSplit(WGImageSearch("CloseButton",t),",")
	if(ta.Length())
	{
		ta[1] += 33
		ta[2] += 6
		RCtrlClick(ta,Closerx,Closery)
		LookForClickClose(t)
	}
}

GPixelSearch(RGB,varia:=0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)
{
	global uid
	;local pBitmap, ARGB, temp
	If !pToken := Gdip_Startup()
	{
	   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	   Exit
	}
	pBitmap := Gdip_BitmapFromHWND(uid)
	Gdip_GetImageDimensions(pBitmap, w,h)
	if(xmin>w or xmax>w or ymin>h or ymax>h)
	{
		MsgBox GPixelSearch of %RGB% has tried to search out of bounds`n%xmin% %xmax% %ymin% %ymax% > %w% %h%
		Exit
	}
	ARGB := DEC2HEX2(RGB | 0xFF000000)
	
	pBitmap2 := Gdip_CreateBitmap(1,1)
	pGraphics:= Gdip_GraphicsFromImage(pBitmap2)
	Gdip_GraphicsClear(pGraphics, ARGB)

	Gdip_ImageSearch(pBitmap, pBitmap2,list_image,xmin,ymin,xmax,ymax,varia,,searchdir,inst)

	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
	return list_image
}

/* much slower than imagesearch of single pixel image
pixelsearch(pBitmap,color)
{
  Gdip_GetImageDimensions(pBitmap, width, height)
  Gdip_LockBits(pBitmap, 0, 0, width, height, Stride, Scan0, BitmapData) 
  Loop, % width
  {
    x := A_Index-1
    Loop, % height
    {
      y := A_Index-1
      if (Gdip_GetLockBitPixel(Scan0, x, y, Stride)=color)
      l .=x "," y "`n"
    }
  }
  Gdip_UnlockBits(pBitmap, BitmapData)
  return l
}
*/

/* machine code doesn't work?
Gdip_PixelSearch(pBitmap, ARGB, ByRef x, ByRef y)
{
	static _PixelSearch
	if !_PixelSearch
	{
		MCode_PixelSearch := "8B44241099535583E2035603C233F6C1F80239742418577E388B7C24148B6C24248B5424188D1C85000000008D64240033C085"
		. "D27E108BCF3929743183C00183C1043BC27CF283C60103FB3B74241C7CDF8B4424288B4C242C5F5EC700FFFFFFFF5DC701FFFFFFFF83C8FF5BC38B4C2"
		. "4288B54242C5F890189325E5D33C05BC3"

		VarSetCapacity(_PixelSearch, StrLen(MCode_PixelSearch)//2)
		Loop % StrLen(MCode_PixelSearch)//2      ;%
			NumPut("0x" SubStr(MCode_PixelSearch, (2*A_Index)-1, 2), _PixelSearch, A_Index-1, "char")
	}
	Gdip_GetImageDimensions(pBitmap, Width, Height)
	if !(Width && Height)
		return -1

	if (E1 := Gdip_LockBits(pBitmap, 0, 0, Width, Height, Stride1, Scan01, BitmapData1))
		return -2

	x := y := 0
	E := DllCall(&_PixelSearch, "uint", Scan01, "int", Width, "int", Height, "int", Stride1, "uint", ARGB, "int*", x, "int*", y)
	Gdip_UnlockBits(pBitmap, BitmapData1)
	return (E = "") ? -3 : E
}
*/