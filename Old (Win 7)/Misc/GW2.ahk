

;#IfWinActive ahk_class ArenaNet_Dx_Window_Class

#IfWinActive Swordsman Online

*CapsLock::
	GetKeyState, state, RButton

	if (state = "D") {
		Click up Right
	} else {
		Click down Right
	} 
	return


*$Mbutton::
	If (Toggle := !Toggle)
		Send {MButton Down}
	Else
		Send {MButton up}
	Return
