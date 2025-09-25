#Requires AutoHotkey v2.0


DoButtonUntilNot(Button) {
    global looping
    while InStr(Button[6], PixelGetColor(Button[1], Button[2])) && looping {
        RClick(Button[3], Button[4], Button[5])
    }
    return
}

DoButton1UntilButton2(Button1, Button2) {
    global looping
    while !CheckButton(Button2) && looping {
        RClick(Button1[3], Button1[4], Button1[5])
        Sleep Random(200,300)
    }
    return
}

CheckButton(Button) {
    return InStr(Button[6], PixelGetColor(Button[1], Button[2]))
}


RClick(x,y,r) {
    ActiveHwnd := WinExist("A")
    MouseGetPos(&oldX, &oldY)
    if x != "" {
        Click x + Random(-r,r), y + Random(-r,r)
        Sleep Random(30,50)
        MouseMove(oldX, oldY)
        WinActivate ActiveHwnd
    }
    return
}
