MapNotes(map)
{
	global CorpseDragV, SwapC, Carry43e, Carry02

	if (map == "4-3E")
	{
		if (CorpseDragV)
		{
			if(Carry43e = "")
			{
				MsgBox Error! Empty Carry43e!
				Exit
			}
			ta := StrSplit(Carry43e,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`nForward Echelons`n" tb " needs full supply"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`nForward Echelons"
	}
	else if (map == "0-2")
	{
		if (CorpseDragV)
		{
			if(Carry02 = "")
			{
				MsgBox Error! Empty Carry02!
				Exit
			}
			ta := StrSplit(Carry02,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`n" tc " needs full supply"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`n"
	}
	else if (map == "3-2N Solo")
		return "32n`n32s"
	else if (map == "3-2N")
		return "32n`n32"
	else if (map == "5-2N")
		return "52n`n52"
	else if (map == "1-6")
		return "1=Ignord`n1=Ignored`n3=RealEchelon`n"
	else if (map == "2-6")
		return "32n`n32"
	else if (map == "3-6")
		return "32n`n32"
	else if (map == "4-6")
		return "32n`n32"
	else if (map == "5-6")
		return "32n`n32"
	else if (map == "6-6")
		return "32n`n32"
	else 
		return "vWorld`nMap Not Found"
}

MapInit(map)
{
	global mapDrag, SwapC, Carry43e, Carry02, Doll1, Doll2
	
	if (map == "4-3E")
	{
		if (mapDrag)
		{
			if(Carry43e = "")
			{
				MsgBox Error! Empty Carry43e!
				Exit
			}
			ta := StrSplit(Carry43e,",")
			Doll1 := ta[1]
			Doll2 := ta[2]
			if (SwapC)
				Swap(Doll1,Doll2)
		}
	}
	else if (map == "5-2E")
		return "52e`n52"
	else if (map == "0-2")
	{
		if (mapDrag)
		{
			if(Carry02 = "")
			{
				MsgBox Error! Empty Carry02!
				Exit
			}
			ta := StrSplit(Carry02,",")
			Doll1 := ta[1]
			Doll2 := ta[2]
			if (SwapC)
				Swap(Doll1,Doll2)
		}
	}
	else if (map == "3-2N Solo")
		return "32n`n32s"
	else if (map == "3-2N")
		return "32n`n32"
	else if (map == "5-2N")
		return "52n`n52"
	else 
		return "vWorld`nMap Not Found"
	return
}

RunMap(map)
{
	global
	RCtrlClick(Combat,51,29)
	GuiControl,, StatA, Waiting for CombatTab PC %ClickCount%
	WaitForPixelClick([283, 193, 0xFFFFFF], ecc) ;WaitFor the white Sangvis icons to appear
	GuiControl,, StatA, Waiting for CombatTab PC to Correct Color %ClickCount%
	ClickUntilPixelColor(CombatTab,, CombatTab, 43, 16)
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
	else if (map == "1-6")
		1_6()
	else if (map == "2-6")
		Sleep 100
	else if (map == "3-6")
		Sleep 100
	else if (map == "4-6")
		Sleep 100
	else if (map == "5-6")
		Sleep 100
	else if (map == "6-6")
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
	ClickUntilPixelColor([157, ty, 0xFFB400],, [157, ty], 23)
	return
}

ClickSubChapter(x)
{
	ty := 128 + (75*x)
	RCtrlClick([476, ty], 135, 24)
}

4_3E()
{
	local heli1, heli2, nme1, nme2, nme3, nme4
	
	FocusChapter(4)
	ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(3)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	heli1 := StrSplit(WGImageSearch("Maps\4_3e\Heli1",,20,,,,,5),",")
	heli1[1] += 36
	heli1[2] += 9
	ClickUntilPixelColor(EchF,, heli1, 45) ;Click Helipad until deploy screen
	
	if (mapDrag)
	{
		SwitchDPS()
		ClickUntilPixelColor(EchF,, heli1, 45)
	}

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	RandSleep(900,1100)
	ControlSend, , c, %CSTitle%
	LookForClickClose(0.7)
	
	heli2 := StrSplit(WGImageSearch("Maps\4_3e\Heli2",,15,,,,,3),",")
	heli2[1] += 3
	heli2[2] += -21
	RCtrlClick(heli2,21)	;Deploy Second Helipad

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3300)

	if (mapDrag)
	{
		Sleep 2000
		ControlSend, , d, %CSTitle%
		LookForClickClose(0.7)

		heli1 := StrSplit(WGImageSearch("Maps\4_3e\Heli1",,20,,,,,5),",")
		heli1[1] += 36
		heli1[2] += 9
		ClickUntilPixelColor(EchF,, heli1, 45)
		ResupplyDPS()

		Sleep 600
		ControlSend, , c, %CSTitle%
		LookForClickClose(0.7)
		
		heli2 := StrSplit(WGImageSearch("Maps\4_3e\Heli2",,15,,,,,3),",")
		heli2[1] += 3
		heli2[2] += -21
	}

	

	RandSleep(300,450)
	RCtrlClick(heli2,21)

	if (!mapDrag)
	{	
		ClickUntilPixelColor(EchF,, heli2, 21)
		ResupplyDPS()
	}

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	RandSleep(300,450)
	nme1 := [(heli2[1]-12), (heli2[2]-162)]
	RCtrlClick(nme1,21)

	RandSleep(300,450)
	nme2 := [(heli2[1]+45), (heli2[2]-324)]
	RCtrlClick(nme2,21)

	RandSleep(400,600)
	ControlSend,, a, %CSTitle%
	LookForClickClose(0.7)

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
	Sleep 70000
	if(mapDrag)
		Sleep 20000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
		
	return
}

0_2()
{
	local tstr, heli2, nme1, nme2, nme3, nme4, nme5
	
	FocusChapter(0)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(2)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	ClickUntilPixelColor(EchF,, [229,331], 45) ;Click Helipad until deploy screen
	
	;if (mapDrag)

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	RandSleep(900,1100)

	return
}

1_6()
{
	local node1, node2, node3, node4, node5, node6, node7, node8
	FocusChapter(1)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(6)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(EchF,, [292, 331], 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3300)

	ClickUntilPixelColor(EchF,, [292, 331], 36)	;Click heli1
	ResupplyDPS()
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	ControlSend, , e, %CSTitle%
	LookForClickClose(0.7)

	node2 := StrSplit(WGImageSearch("Maps\1_6\Enemy1",,25,,,,,6),",")
	node2[1] += 3
	node2[2] += -9

	node1 := [node2[1]+120, node2[2]-183]
	node3 := [node2[1]+165, node2[2]+186]
	node4 := [node2[1]+450, node2[2]+9]
	node5 := [node2[1]+231, node2[2]-3]
	node6 := [node2[1]+408, node2[2]-183]
	node7 := [node2[1]+594, node2[2]-96]
	node8 := [node2[1]+573, node2[2]+111]
	RCtrlClick(node1,21)

	RandSleep(300,450)
	RCtrlClick(node2,21)
	
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	return
}


2_6()
{

	return
}