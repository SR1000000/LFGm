MapNotes(map)
{
	global CorpseDragV, SwapC, Carry43e, Carry02

	if (map == "4-3E")
	{
		if (CorpseDragV)
		{
			ta := StrSplit(Carry43e,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`nForward Echelons`n" tb " needs full supply`nZoomed Out Map"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`nForward Echelons`nZoomed Out Map"
	}
	else if (map == "0-2")
	{
		if (CorpseDragV)
		{
			ta := StrSplit(Carry02,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`n389 Empty`n" tc " needs full supply"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`n"
	}
	else if (map == "3-2N Solo")
		return "1=Solo AR"
	else if (map == "3-2N")
		return "2n`n32"
	else if (map == "5-2N")
		return "MG Carry`n52"
	else if (map == "1-6")
		return "1=Ignored`n1=Ignored`n3=Grizzly`n"
	else if (map == "2-6")
		return "1=Ignored`n1=Ignored`n3=GrizzlyWelrod`n"
	else if (map == "3-6")
		return "1=Dummy HG`n1=Ignored`n3=5HG`n"
	else if (map == "4-6")
		return "1=Dummy HG`n1=Ignored`n3=RealEchelon(1WA2k)`n"
	else if (map == "5-6")
		return "1=Dummy HG`n1=Ignored`n3=RealEchelon(1WA2k)`n"
	else if (map == "6-6")
		return "1=Ignored`n1=Ignored`n3=RealEchelon`n"
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
			if(!Carry43e)
			{
				MsgBox Error, Empty Carry43e, Exiting
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
			if(!Carry02)
			{
				MsgBox Error, Empty Carry02, Exiting
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

MidBattleCheck()
{	
	global CombatPause,ecc,Safe,Saferx,Safery
	if(PixelIs(CombatPause))
	{
		DoThisUntilThat("RandSleep","PixelNot",CombatPause,,500)
		Sleep 2000
		ClickUntilImage("LoadScreen",,Safe,Saferx,Safery)
	}
	Sleep 500
}

RunMap(map)
{
	global
	ClickUntilPixelNot(Combat,,Combat,51,29)
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
	{	
		FocusChapter(1)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		1_6()
	}
	else if (map == "2-6")
	{	
		FocusChapter(2)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		2_6()
	}
	else if (map == "3-6")
	{	
		FocusChapter(3)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		3_6()
	}
	else if (map == "4-6")
	{	
		FocusChapter(4)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		4_6()
	}
	else if (map == "5-6")
	{
		FocusChapter(5)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		5_6()
	}
	else if (map == "6-6")
	{
		FocusChapter(6)
		ClickSubChapter(6)
		WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)
		5_6()
	}
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
{	;trying zoomed out 4-3e
	local heli1 := [139, 346], heli2 := [676, 424], nme1 := [669, 328]
		, nme2 := [703, 229], nme3 := [646, 130], nme4 := [652, 178], tstr
		, nme1chk
	
	FocusChapter(4)
	ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(3)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	;If TDollList full, need enhance

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	while (WGImageSearch("Maps\4_3e\ChkZoomed1",1,0,,,,,3))
	{
		MsgBox 4-3E Map not zoomed out
		
	}
	ClickUntilPixelColor(EchF,, heli1, 27) ;Click Helipad until deploy screen
	
	if (mapDrag)
	{
		SwitchDPS()
		ClickUntilPixelColor(EchF,, heli1, 27)
	}

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	RandSleep(300,450)
	RCtrlClick(heli2,15)	;Deploy Second Helipad
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	;Strike 1: skipped clicking Start Op button (unregistered click?)
	;Attempted Solution: separate CUPC
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	Sleep 2000

	if (mapDrag)
		ResupplyDPS(heli1, 27)

	if (!mapDrag)
		ResupplyDPS(heli2, 15)
	else
	{
		RandSleep(300,450)
		RCtrlClick(heli2, 15)	;should replace with cupc
	}

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	RCtrlClick(nme1,12)
	RandSleep(300,450)
	RCtrlClick(nme2,12)
	RandSleep(300,450)
	RCtrlClick(nme3,12)

	RandSleep(400,600)
	ControlSend,, z, %CSTitle%
	LookForClickClose(0.7)

	RandSleep(300,450)
	RCtrlClick(nme4,18)
/*
	local heli1, heli2, nme1, nme2, nme3, nme4
	
	FocusChapter(4)
	ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(3)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	;If TDollList full, need enhance

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

	;Strike 1: skipped clicking Start Op button (unregistered click?)
	;Attempted Solution: separate CUPC
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	Sleep 3000

	if (mapDrag)
	{
		Sleep 1000
		ControlSend, , d, %CSTitle%
		LookForClickClose(0.7)

		heli1 := StrSplit(WGImageSearch("Maps\4_3e\Heli1",,20,,,,,5),",")
		heli1[1] += 36
		heli1[2] += 9
		
		ResupplyDPS(heli1, 45)

		Sleep 600
		ControlSend, , c, %CSTitle%
		LookForClickClose(0.7)
		
		heli2 := StrSplit(WGImageSearch("Maps\4_3e\Heli2",,15,,,,,3),",")
		heli2[1] += 3
		heli2[2] += -21
	}

	RandSleep(300,450)
	if (!mapDrag)
		ResupplyDPS(heli2, 21)
	else
		RCtrlClick(heli2, 21)

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	nme1 := [(heli2[1]-12), (heli2[2]-162)]
	RCtrlClick(nme1,21)

	RandSleep(300,450)
	nme2 := [(heli2[1]+45), (heli2[2]-324)]
	RCtrlClick(nme2,21)

	loop
	{
		RandSleep(400,600)
		ControlSend,, a, %CSTitle%
		LookForClickClose(0.7)

		nme3 := StrSplit(WGImageSearch("Maps\4_3e\Enemy4",,20,,,,,7),",")
		nme3[1] += -6
		nme3[2] += -12
	} until nme3[2] > 270
	RCtrlClick(nme3,21)

	RandSleep(300,450)
	nme4 := [(nme3[1]+12), (nme3[2]-219)]
	RCtrlClick(nme4,21)
*/
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 70000
	if(mapDrag)
		Sleep 20000
	WGImageSearch("PlanButton",-120)

	;RandSleep(5000,20000)	;testing large random wait
	;Strike 1: Click on EndRound button not registering
	;Attempted fix: change rcc to cupn
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
		
	return
}

0_2()
{
	local heli1:=[229,331], heli2, 
	
	FocusChapter(0)

	GuiControl,, StatA, Clicking Sub Chapter %ClickCount%
	ClickSubChapter(2)

	GuiControl,, StatA, Clicking NormalBattle button %ClickCount%
	WaitForPixelClick(NormalB, ecc, NormalB, NormalBrx, NormalBry)

	GuiControl,, StatA, Wait for active nodes screen %ClickCount%
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	ClickUntilPixelColor(DepNight,, heli1, 45) ;Click Helipad until deploy screen
	
	;if (mapDrag)

	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	RandSleep(900,1100)

	return
}


2_6()	;Each endround recenters map?
{	;Farm and NonFarm versions are same
	local heli1 := [355, 331], node1 := [313, 118], node2 := [556, 319]
	, node3 := [742, 259], node4 := [760,94]

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3300)

	;Click heli1
	ResupplyDPS(heli1, 36)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
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

	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 4000

	node2 := [403, 331]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node2,21)
	RandSleep(300,450)
	RCtrlClick(node3,21)
	RandSleep(300,450)
	RCtrlClick(node4,21)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
	return
}
