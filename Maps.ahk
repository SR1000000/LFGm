MapNotes(map)
{
	global CorpseDragV
	if (map == "4-3E")
	{
		if (CorpseDragV)
			return "1=ARCarry`n2=RealEchelon (Carry pos2)`nForward Echelons"
		else
			return "1=Dummy HG`n2=Real Echelon`nForward Echelons"
	}
	else if (map == "5-2E")
		return "52e`n52"
	else if (map == "0-2")
	{
		if (CorpseDragV)
			return "1=ARCarry`n2=RealEchelon (Carry pos2)`n"
		else
			return "1=Dummy HG`n2=Real Echelon`n"
	}
	else if (map == "3-2N Solo")
		return "32n`n32s"
	else if (map == "3-2N")
		return "32n`n32"
	else if (map == "5-2N")
		return "52n`n52"
	else 
		return "vWorld`nMap Not Found"
}

RunMap(map)
{
	global
	RCtrlClick(Combat,51,29)
	GuiControl,, StatA, Waiting for CombatTab PC %ClickCount%
	WaitForPixelClick([283, 193, 0xFFFFFF], ecc) ;WaitFor the white Sangvis icons to appear
	GuiControl,, StatA, Waiting for CombatTab PC to Correct Color %ClickCount%
	ClickUntilPixelColor(CombatTab, ecc, CombatTab, 43, 16)
	GuiControl,, StatA, RunMap %map% %ClickCount%
	if (map == "4-3E")
		4_3E()
	else if (map == "5-2E")
		Sleep 100
	else if (map == "0-2")
		0_2()
	else if (map == "3-2N Solo")
		Sleep 100
	else if (map == "3-2N")
		Sleep 100
	else if (map == "5-2N")
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
	global ecc
	ty := 124+(63*x)
	GuiControl,, StatA, Waiting for Chapter PC %ClickCount%
	;Sleep 200
	ClickUntilPixelColor([157, ty, 0xFFB400], ecc, [157, ty], 23)
	return
}

ClickSubChapter(x)
{
	ty := 128 + (75*x)
	RCtrlClick([476, ty], 135, 24)
}

4_3E()
{
	local tstr, heli2, nme1, nme2, nme3, nme4
	
	FocusChapter(4)
	ClickUntilPixelColor(EmerChk, ecc, EmerB, EmerBr)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	;Sleep 200
	ClickSubChapter(3)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	ClickUntilPixelColor(EchF, ecc, [229,331], 45) ;Click Helipad until deploy screen
	
	;if (CorpseDragV)

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	RandSleep(900,1100)
	ControlSend, , c, %CSTitle%
	
	heli2 := StrSplit(WGImageSearch("Maps\4_3e\Heli2",,15,,,,,7),",")
	heli2[1] += 9
	heli2[2] += -2
	RCtrlClick(heli2,21)	;Deploy Second Helipad

	;if (CorpseDragV)

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations

	RandSleep(3000,3300)
	ClickUntilPixelColor(PlanB, ecc, PlanB, PlanBrx, PlanBry)	;Click Planning

	RandSleep(300,450)
	RCtrlClick(heli2,21)

	RandSleep(300,450)
	nme1 := [(heli2[1]-12), (heli2[2]-162)]
	RCtrlClick(nme1,21)

	RandSleep(300,450)
	nme2 := [(heli2[1]+45), (heli2[2]-324)]
	RCtrlClick(nme2,21)

	RandSleep(300,450)
	ControlSend,, a, %CSTitle%

	nme3 := StrSplit(WGImageSearch("Maps\4_3e\Enemy4",,20,,,,,7),",")
	nme3[1] += -6
	nme3[2] += -12
	RCtrlClick(nme3,21)

	RandSleep(300,450)
	nme4 := [(nme3[1]+12), (nme3[2]-219)]
	RCtrlClick(nme4,21)

	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 80000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	RandSleep(4577,6941)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	ClickUntilImage("LoadScreen",ecc,Safe,Saferx,Safery)
	WaitForPixelClick(RetHomeB,ecc,RetHomeB,RetHomeBrx,RetHomeBry)
		
	return
}

0_2()
{
	local tstr, heli2, nme1, nme2, nme3, nme4
	
	FocusChapter(0)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(2)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	ClickUntilPixelColor(EchF, ecc, [229,331], 45) ;Click Helipad until deploy screen
	
	;if (CorpseDragV)

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	RandSleep(900,1100)

	return
}