#Requires AutoHotkey v2.0

/*
	GUI for me Limbus macros
	MUST BE RUN -AFTER- program is loaded
*/
#SingleInstance

#include PixelConstants.ahk ; include variables set to Pixel search values
#include ShinsImageScanClass.ahk ; include outside library


; Define the path to the INI file
iniFile := "configLimbus.ini"

; Read values from the INI file
target := IniRead(iniFile, "Settings", "TargetWindow")
ctl := 'RichEditD2DPT1'

if !WinExist(target) 
    MsgBox("Target window not found")

; Reset target window position and size
WinMove -1080, 0, 1080, 700, target

; Coordmode for screen instead of window
CoordMode "Pixel"
CoordMode "Mouse"

; Remove delay of MouseClick
SetMouseDelay -1

;scan := ShinsImageScanClass(target)

myGui := Gui()
myGui.Title := "Limbus Company"
myGui.Add("CheckBox", "vMDH", "MD Hard")
myGui.Add("Button", "w200 h30 vButton_Loop1", "Start Loop").OnEvent("Click", ToggleLoop)
myGui.OnEvent("Close", (*) => ExitApp())
myGui.Show("w220 h100")

StatusBar := MyGui.Add("StatusBar",,"Ready")
StatusBar.SetText("Ready2")


looping := false
loopTimer := 1000  ; Loop interval in milliseconds
loopCounter := 0
PickSinnerToggle := 0

ToggleLoop(*) {
    global looping, loopTimer, loopCounter, loopCount
    looping := !looping
    btnText := looping ? "Stop Loop" : "Start Loop"
    myGui["Button_Loop1"].Text := btnText

    if looping {
        SetTimer(LoopFunction, loopTimer)
        loopCount := 0
        StatusBar.SetText("Looping " loopCount)
    } else {
        SetTimer(LoopFunction, 0)
        StatusBar.SetText("Done")
    }
}

LoopFunction(*) {
    global loopCount, loopCounter, PickSinnerToggle, loopTimer
    loopCount++
    StatusBar.SetText("Looping " loopCount)
    SetTimer(LoopFunction, 1000)
    
    g := myGui.Submit(false)
    if g.MDH {
        SB := [0]
    } else {
        SB := StartBattle
        ES := 0
        TB := 0
        CB := 0
        CR := 0
        SE := 0
    }
    
    ToolTip("")
    while PixelSearch(&x, &y, SB[1], SB[2], SB[3], SB[4], SB[5], 5) {
        Sleep 400
        DoPEnter(x, y)
        loopCounter++
        ;ToolTip("pEnter sent" loopCounter)
        return
    }
    while InStr(EnterStage[3], PixelGetColor(EnterStage[1], EnterStage[2])) {
        RClick(EnterStage[1], EnterStage[2])
        ToolTip("EnterStage Hit")
        return
    }
    while InStr(ToBattle[3], PixelGetColor(ToBattle[1], ToBattle[2])) {
        Rclick(ToBattle[1], ToBattle[2])
        ToolTip("ToBattle Hit")
        Sleep 1000
        return
    }
    if PixelSearch(&x, &y, ConfirmButton[1], ConfirmButton[2], ConfirmButton[1], ConfirmButton[2], ConfirmButton[3], 3) {
        ToolTip("ConfirmButton Hit")
        RClick(ConfirmButton[1],  ConfirmButton[2])
    }
    else if InStr(SkipEvent[3], PixelGetColor(SkipEvent[1], SkipEvent[2])) {
        ;ToolTip("SkipEvent Hit")
        while InStr(SkipCheck1[3], PixelGetColor(SkipCheck1[1], SkipCheck1[2])) {
            ToolTip("SkipCheck1 Hit")
            RClick(SkipEvent[1],  SkipEvent[2])
            Sleep Random(50,150)
            PickSinnerToggle := 0
        }
        if PixelSearch(&x, &y, ContinueRed[1], ContinueRed[2], ContinueRed[1], ContinueRed[2], ContinueRed[3], 2) {
            ToolTip("RedButton Hit")
            RClick(ContinueRed[1],  ContinueRed[2])
            return
        } 
        if InStr(SkipCheck2[3], PixelGetColor(SkipCheck2[1], SkipCheck2[2])) {
            ToolTip("SkipCheck2 Hit")
            RClick(SkipEvent[1],  SkipEvent[2])
            SetTimer(LoopFunction, Random(70,150))
            return
        }   
        if InStr(SkipCheck3[3], PixelGetColor(SkipCheck3[1], SkipCheck3[2])) {
            ToolTip("SkipCheck3 Hit")
            if PixelSearch(&x, &y, -1043, PickSinner[2], -274, PickSinner[2], PickSinner[3], 5) && !PickSinnerToggle {
                RClick(x, y+41)
                PickSinnerToggle := 1
            } else {
                RClick(SkipEvent[1],  SkipEvent[2])
                SetTimer(LoopFunction, Random(50,120))
            }
        }
    }
}

/*DoPEnter2() {
    ActiveHwnd := WinExist("A")
    ;MsgBox(ActiveHwnd)

    ControlSend("p",, target)
    WinActivate target
    WinActivate ActiveHwnd
    Sleep 70 ;Random(50,90)
    ControlSend("{Enter}",, target)
    WinActivate target
    WinActivate ActiveHwnd
    return
}*/

DoPEnter(x, y) {
    ActiveHwnd := WinExist("A")
    MouseGetPos(&oldX, &oldY)
    if x != "" {
        Click x+90, y
        Sleep Random(100,200)
        Click x, y
        Sleep 50
        MouseMove(oldX, oldY)
        WinActivate ActiveHwnd
    }
    return
}

RClick(x,y) {
    ActiveHwnd := WinExist("A")
    MouseGetPos(&oldX, &oldY)
    if x != "" {
        Click x + Random(-4,4), y + Random(-4,4)
        Sleep Random(30,50)
        MouseMove(oldX, oldY)
        WinActivate ActiveHwnd
    }
    return
}

F1::
{
    output := ""
    for x in [SkipEvent] {
        p := PixelGetColor(x[1], x[2])
        output := output . "`n" . x[1] . " " . x[2] . " " . p . " " . InStr(x[3],p)
    }
    
    ToolTip(output)
}

F2::
{
    PixelSearch(&x, &y, StartBattle[1], StartBattle[2], StartBattle[3], StartBattle[4], StartBattle[5], 10)
    if x != "" {
        p := Format("{:X}", PixelGetColor(x, y))   ;7: A27F4A
    }
    if IsSet(p) {
        ToolTip(p "`nx: " x " y: " y)
    }
}

F3::
{
    MouseGetPos(&x, &y, &h, &c)
    ;MouseGetPos(,,,&h, 2)
    p := PixelGetColor(x, y)
    ToolTip("x: " x "`ny: " y "`nHWND: " h "`nPixelColor: " p)
}
F4::
{
    p := PixelGetColor(ConfirmButton[1], ConfirmButton[2])
    ToolTip(ConfirmButton[1] " " ConfirmButton[2] " " p)
    
}