global nox_id
global step

init_drag()
{
	ControlGet, nox_id, Hwnd, , ScreenBoardClassWindow, NoxPlayer
	step := 10
}

randomize(value, variance)
{
    Random, new_value, value - variance, value + variance
    return new_value
}

GetLParam(x, y)
{
    return (x & 0xFFFF) | (y & 0xFFFF) << 16
}

SendMiddleButtonDown(x, y)
{
    lparam := GetLParam(x, y)
    PostMessage, 0x207, 0x0010, %lparam%, , ahk_id %nox_id%    
}

SendMiddleButtonUp(x, y)
{
    lparam := GetLParam(x, y)
    PostMessage, 0x208, 0x0000, %lparam%, , ahk_id %nox_id%    
}

SendLButtonDown(x, y)
{
    lparam := GetLParam(x, y)
    PostMessage, 0x201, 0x0001, %lparam%, , ahk_id %nox_id%    
}

SendLButtonUp(x, y)
{
    lparam := GetLParam(x, y)
    PostMessage, 0x202, 0, %lparam%, , ahk_id %nox_id%
}

SendMouseMove(x, y)
{
	local temp
    lparam := GetLParam(x, y)
    PostMessage, 0x200, 0x0001, %lparam%, , ahk_id %nox_id% ;wparam originally 0x0001
}

; Finger on top of the screen, and drag down
DragUpToDown(x, y_start, y_end)
{
    Global
    ;x := randomize(x, 5)
    ;y_start := randomize(y_start, 5)
    ;y_end := randomize(y_end, 5)
    SendLButtonDown(x, y_start)
    y := y_start
    Loop {
        y := y + step
        SendMouseMove(x, y)        
        if (y >= y_end) {            
            break
        }
        sleep 1
    }
    SendLButtonUp(x, y_end)
    sleep 100
}
; Finger on bottom of the screen, and drag up
DragDownToUp(x, y_start, y_end)
{
    Global
	x := randomize(x, 5)
    y_start := randomize(y_start, 5)
    y_end := randomize(y_end, 5)
    SendLButtonDown(x, y_start)
    y := y_start
    Loop {
        y := y - step
        SendMouseMove(x, y)        
        if (y <= y_end) {            
            break
        }
        sleep 1
    }
    SendLButtonUp(x, y_end)
    sleep 100
}

; Finger on right of the screen, and drag left
DragRightToLeft(y, x_start, x_end)
{
    	Global
	y := randomize(y, 5)
	x_start := randomize(x_start, 5)
	x_end := randomize(x_end, 5)
	SendLButtonDown(x_start, y)
	x := x_start
	Loop 
	{
        	x := x - step
	        SendMouseMove(x, y)
	        if (x <= x_end)            
        		break
		sleep 1
	}
	SendLButtonUp(x_end, y)
	sleep 100
}

; Finger on left of the screen, and drag right
DragLeftToRight(y, x_start, x_end)
{
    Global
    y := randomize(y, 5)
    x_start := randomize(x_start, 5)
    x_end := randomize(x_end, 5)
    SendLButtonDown(x_start, y)
    x := x_start
    Loop {
        x := x + step
        SendMouseMove(x, y)
        if (x >= x_end) {            
            break
        }
        sleep 1
    }
    SendLButtonUp(x_end, y)
    sleep 100
}