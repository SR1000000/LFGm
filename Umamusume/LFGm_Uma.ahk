#Requires AutoHotkey v2.0

/*
	GUI for me Umamusume macros
	MUST BE RUN -AFTER- program is loaded
*/
#SingleInstance

#include PixelConstants.ahk ; include variables set to Pixel search values
#include PixelFunctions.ahk ; Rclick, DoButton's, 
#include ShinsImageScanClass.ahk ; include outside library


; Define the path to the INI file
iniFile := "configUma.ini"

; Read values from the INI file
target := IniRead(iniFile, "Settings", "TargetWindow")
ctl := 'RichEditD2DPT1'

if !WinExist(target) 
    MsgBox("Target window not found")

; Store current window position and size (xpos, ypos, xsize, ysize)
OldWindow := []

; Reset target window position and size (set size first, then move, some unity windows dislike doing both at the same time)
WinMove , , , 640, target
Sleep 500
WinMove -1080, 0, , , target

; Coordmode for screen instead of window
CoordMode "Pixel"
CoordMode "Mouse"

; Remove delay of MouseClick
SetMouseDelay -1

;scan := ShinsImageScanClass(target)

myGui := Gui()
myGui.Title := "Umamusume"
myGui.Add("CheckBox", "vMDH", "MD Hard")
myGui.Add("Button", "w200 h30 vButton_Loop1", "Start Loop").OnEvent("Click", ToggleLoop)
myGui.OnEvent("Close", (*) => DoExit())
myGui.Show("w220 h150")

StatusBar := MyGui.Add("StatusBar",,"Ready")
StatusBar.SetText("Ready2")


looping := false
loopTimer := 1000  ; Loop interval in milliseconds
loopCounter := 0
PickSinnerToggle := 0

DoExit(*) {
    ; restore window to main monitor, then exit
    WinMove 100, 100, , , target
    WinMove , , , 900, target
    ExitApp()
}

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
    global loopCount, loopCounter, PickSinnerToggle, loopTimer, looping
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
    if CheckButton(SelectOpponent) || CheckButton(Next1) {
        SetTimer(LoopFunction, 0)
        if CheckButton(SelectOpponent)
            DoButton1UntilButton2(SelectOpponent, Connecting)

        while !CheckButton(Next1) && looping
            Sleep Random(50,100)
        DoButtonUntilNot(Next1)

        while !CheckButton(RaceButton) && looping
            Sleep Random(50,100)
        DoButtonUntilNot(RaceButton)

        while !CheckButton(SeeResults) && looping
            Sleep Random(50,100)
        DoButton1UntilButton2(SeeResults, RaceAgain)
        Sleep 500
        DoButtonUntilNot(RaceAgain)
        Sleep 1000
    }
    if looping
        SetTimer(LoopFunction, 1000)
}

F1::
{
    output := ""
    for x in [SelectOpponent] {
        p := PixelGetColor(x[1], x[2])
        output := output . "`n" . x[1] . " " . x[2] . " " . p
    }
    
    ToolTip(output)
}

F2::
{
    PixelSearch(&x, &y, StartBattle[1], StartBattle[2], StartBattle[3], StartBattle[4], StartBattle[5], 5)
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
    
    MsgBox A_AhkVersion

    DoButtonUntilNot(Next1)
    
}