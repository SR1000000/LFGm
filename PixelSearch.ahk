
GImageSearch(filepath,varia:=0,xmin:=0,ymin:=0,xmax:=0,ymax:=0,searchdir:=1,inst:=1)
{
	global uid
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
	return list_image
}

WGImageSearch(filepath, SearchNumber := 0)
{
	local tx, ty, wx, wy, tstr, Found := 0
	GuiControl,, StatA, W %filepath% %ClickCount%
	Found := GImageSearch(filepath,0)
	while found == 0
	{
		SearchNumber += 5
		Found := GImageSearch(filepath,SearchNumber)
		GuiControl,, StatA, NotFound pixel shade offset [%SearchNumber%]
		If SearchNumber >= 200
		{
			GuiControl,, StatA, WGImageSearch failed %x% %ClickCount%
			Exit
		}
	}
	GuiControl,, StatA, %filepath% Found offset [%SearchNumber%] ;%tx% %ty%
	return Found
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