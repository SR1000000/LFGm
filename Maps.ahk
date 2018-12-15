MapNotes(map)
{
	if (map == "4-3E")
		return "1=Dummy HG`n2=Real Echelon`nForward Echelons"
	else if(map == "5-2E")
		return "52e`n52"
	else if(map == "0-2")
		return "02`n02"
	else if(map == "3-2N Solo")
		return "32n`n32s"
	else if(map == "3-2N")
		return "32n`n32"
	else if(map == "5-2N")
		return "52n`n52"
	else 
		return "vWorld`nMap Not Found"
}

RunMap(map)
{
	global
	RCtrlClick(Combat,51,29)
	GuiControl,, StatA, Waiting for CombatTab PC %ClickCount%
	WaitForPixelClick([283, 193, 0xFFFFFF], 10) ;WaitFor the white on chapter tabs to load
	GuiControl,, StatA, Waiting for CombatTab PC to Correct Color %ClickCount%
	ClickUntilPixelColor(CombatTab, 10, CombatTab, 43, 16)
	GuiControl,, StatA, RunMap %map% %ClickCount%
	if (map == "4-3E")
		4_3E()
	else if(map == "5-2E")
		Sleep 100
	else if(map == "0-2")
		Sleep 100
	else if(map == "3-2N Solo")
		Sleep 100
	else if(map == "3-2N")
		Sleep 100
	else if(map == "5-2N")
		Sleep 100
	else 
	{
		GuiControl,, StatA, RunMap invalid map
		Exit
	}
	return
}

FocusChapter(x)
{
	ty := 124+(63*x)
	GuiControl,, StatA, Waiting for Chapter PC %ClickCount%
	;Sleep 200
	ClickUntilPixelColor([157, ty, 0xFFB400], ecc, 157, ty, 23)
	return
}

ClickSubChapter(x)
{
	ty := 128 + (75*x)
	RCtrlClick([476, ty], 135, 24)
}

4_3E()
{
	local tstr, ta, tx, ty, wx, wy
	
	FocusChapter(4)
	ClickUntilPixelColor(EmerChk, 10, EmerB, 15)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	;Sleep 200
	ClickSubChapter(3)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, 10, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick([229, 331, 0x96C8FA], 10) ;Wait for active nodes screen

	Sleep 100
	ClickUntilPixelColor(EchF, 10, [229,331], 45) ;Click Helipad until deploy screen

	;Sleep 500
	WaitForPixelClick(DepOk, 10, DepOk, DepOkrx, DepOkry)
	;Deploy Ok
	Sleep 1000
	ControlSend, , c, %CSTitle%
	;tstr := RFindClick("Maps\4_3e\Heli2", " rNoxPlayer mc o20 w30000,50 dright",14,12)
	
	;Deploy Second Helipad
	;WaitForPixelClick(DepOk, 10, DepOk, DepOkrx, DepOkry)
	;Deploy Ok

	;Click Start Battle
	;Click Planning
	
	return
}