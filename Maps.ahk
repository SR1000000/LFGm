MapNotes(map)
{
	global CorpseDragV, SwapC, Carry43e, Carry02, Carry32n

	if (map == "4-3E")
	{
		if (CorpseDragV)
		{
			ta := StrSplit(Carry43e,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`nForward Echelons`n1." tb " needs full supply`n"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`nForward Echelons`n"
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
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`n389 Empty, 6MT`n1." tb " needs full supply"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`n"
	}
	else if (map == "3-2N Solo")
		return "1=Solo AR"
	else if (map == "3-2N")
	{
		if (CorpseDragV)
		{
			ta := StrSplit(Carry32n,",")
			tb := ta[1]
			tc := ta[2]
			if (SwapC)
				Swap(tb,tc)
			return % "1=" tb "`n2=RealEchelon (" tc " pos2)`n389 Empty`n1." tc " needs full supply"
		}
		else
			return "1=Dummy HG`n2=Real Echelon`n"
	}
	else if (map == "3-6F")
		return "1=Dummy HG`n2=Ignored`n3=3HG`n55Max`n"
	else if (map == "4-6F")
		return "1=Dummy HG`n2=Ignored`n3=RealEchelon(1WA2k)`n70Max`n"
	else if (map == "5-6F")
		return "1=Dummy HG`n2=Ignored`n3=RealEchelon(1WA2k)`n85Max`n"
	else if (map == "1-6")
		return "1=Ignored`n2=Ignored`n3=Grizzly`n25Max`n"
	else if (map == "2-6")
		return "1=Ignored`n2=Ignored`n3=GrizzlyWelrod`n35Max`n"
	else if (map == "3-6")
		return "1=Dummy HG`n2=Ignored`n3=3HG`n55Max`n"
	else if (map == "123-6")
		return "1=Dummy HG`n2=Ignored`n3=3HG`n55Max`n"
	else if (map == "4-6")
		return "1=Dummy HG`n2=Ignored`n3=G11Exodia`n70Max`n"
	else if (map == "5-6")
		return "1=Dummy HG`n2=Ignored`n3=G11Exodia`n85Max`n"
	else if (map == "6-6")
		return "1=Ignored`n2=Ignored`n3=G11Exodia`n95Max`n"
	else if (map == "456-6")
		return "1=Dummy HG`n2=Ignored`n3=G11Exodia`n85Max`n"
	else if (map == "6-4E")
		return "1=Dummy HG`n2=ARSMG`n3=BossKillers`nHalfway only, not Full Auto`nDO NOT REPEAT"
	else if (map == "Ev1-2")
		return "1=G11 Exodia+Thompson`nBe on Arctic Warfare Page`nOnly Run Once"
	else
		return "vWorld`nMap Not Found"
}

MapInit(map)
{
	global mapDrag, SwapC, Carry43e, Carry02, Carry32n, Doll1, Doll2
	Carry := ""
	
	if (map == "4-3E")
		Carry := Carry43e
	else if (map == "5-2E")
		return "52e`n52"
	else if (map == "0-2")
		Carry := Carry02
	else if (map == "3-2N Solo")
		return "32n`n32s"
	else if (map == "3-2N")
		Carry := Carry32n
	else 
		return "vWorld`nMap Not Found"
	
	if (mapDrag)
	{
		if(!Carry)
		{
			MsgBox Error, Empty Carry43e, Exiting
			Exit
		}
		ta := StrSplit(Carry,",")
		Doll1 := ta[1]
		Doll2 := ta[2]
		if (SwapC)
			Swap(Doll1,Doll2)
	}
	return
}

MidBattleCheck()
{	
	global CombatPause,ecc,Safe,Saferx,Safery
	if(PixelIs(CombatPause))
	{
		DoThisUntilThat("RandSleep","PixelNot",CombatPause,,500)
		RandSleep(4029,4564)
		ClickUntilImage("LoadScreen",,Safe,Saferx,Safery)
	}
	Sleep 500
	return
}

FriendStandby(xy,r)
{
	if(!xy.length())
	{
		MsgBox Empty array passed to FriendStandby! Exiting
		Exit
	}
	StandByChk := [xy[1], xy[2]+45, 0xEEFF22]
	StandByB := [xy[1], xy[2]+55]
	ClickUntilPixelColor(StandByChk,,xy,r)
	ClickUntilPixelNot(StandByChk,,StandByB,36,12)
	return
}

RunMap(map)
{
	global
	ClickUntilPixelNot(Combat,,Combat,51,29)
	GuiControl,, StatA, Waiting for CombatTab PC %ClickCount%
	WaitForPixelClick(RetHome, ecc)
	;WaitForPixelClick([283, 193, 0xFFFFFF], ecc) ;WaitFor the white Sangvis icons to appear
	GuiControl,, StatA, Waiting for CombatTab PC to Correct Color %ClickCount%
	ClickUntilPixelColor(CombatTab,, CombatTab, 43, 16)
	GuiControl,, StatA, RunMap %map% %ClickCount%
	if (map == "4-3E")
	{
		FocusChapter(4,1)
		ClickSubChapter(3)
		4_3E()
	}
	else if (map == "5-2E")
		Sleep 100
	else if (map == "0-2")
	{
		FocusChapter(0)
		ClickSubChapter(2)
		0_2()
	}
	else if (map == "Ev1-2")
		EV1_2()
	else if (map == "3-2N")
		Sleep 100
	else if (map == "1-6")
	{	
		FocusChapter(1)
		ClickSubChapter(6)
		1_6()
	}
	else if (map == "2-6")
	{	
		FocusChapter(2)
		ClickSubChapter(6)
		2_6()
	}
	else if (map == "3-6")
	{	
		FocusChapter(3)
		ClickSubChapter(6)
		3_6()
	}
	else if (map == "123-6")
	{	
		FocusChapter(1)
		ClickSubChapter(6)
		1_6()
		ExpeditionCheck(Home)
		FocusChapter(2)
		ClickSubChapter(6)
		2_6()
		ExpeditionCheck(Home)
		FocusChapter(3)
		ClickSubChapter(6)
		3_6()
	}
	else if (map == "3-6F")
	{	
		FocusChapter(3)
		ClickSubChapter(6)
		3_6(1)
	}
	else if (map == "4-6")
	{	
		FocusChapter(4)
		ClickSubChapter(6)
		4_6()
	}
	else if (map == "4-6F")
	{	
		FocusChapter(4,1)
		ClickSubChapter(4)
		4_6(1)
	}
	else if (map == "5-6")
	{
		FocusChapter(5)
		ClickSubChapter(6)
		5_6()
	}
	else if (map == "5-6F")
	{
		FocusChapter(5)
		ClickSubChapter(6)
		5_6(1)
	}
	else if (map == "6-6")
	{
		FocusChapter(6)
		ClickSubChapter(6)
		6_6()
	}
	else if (map == "456-6")
	{
		FocusChapter(4)
		ClickSubChapter(6)
		4_6()
		ExpeditionCheck(Home)
		FocusChapter(5)
		ClickSubChapter(6)
		5_6()
		ExpeditionCheck(Home)
		FocusChapter(6)
		ClickSubChapter(6)
		6_6()
	}
	else if (map == "6-4E")
	{
		FocusChapter(6,1)
		ClickSubChapter(4)
		6_4E()
	}
	else 
	{
		GuiControl,, StatA, RunMap invalid map
		Exit
	}
	return
}

FocusChapter(x,e := 0, n := 0)
{
	global ecc, EmerChk, EmerB, EmerBr
	ty := 124+(63*x)
	GuiControl,, StatA, Waiting for Chapter PC %ClickCount%
	;Sleep 200
	ClickUntilPixelColor([157, ty, 0xFFB400],, [157, ty], 23)
	if(e)
		ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)
	if(n)	
		ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)
	return
}

ClickSubChapter(x)
{
	global NormalB, NormalBrx, NormalBry, NormalBChk, RedSangvis
	WaitForPixelClick([283, 193, 0xFFFFFF], ecc) ;WaitFor the white Sangvis icons to appear
	ty := 128 + (75*x)
	while(!PixelIs(NormalB))
	{
		RCtrlClick([476, ty], 135, 24)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalBChk,, NormalB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
}
Map_Execute(LongWait := 10000)
{
	global
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep %LongWait%
	WGImageSearch("PlanButton",-120)
	return
}
Map_EndRound(Wmin := 3942, Wmax := 7529)
{
	global
	RandSleep(Wmin,Wmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	RandSleep(2449,3664)
	return
}
Map_EndRoundFinal()
{
	global
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	ExpeditionCheck(RetHome) ;WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
	return
}

4_3E()
{	;trying zoomed out 4-3e
	local heli1 := [139, 346], heli2 := [676, 424], nme1 := [669, 328], LongWait := 70000
		, nme2 := [703, 229], nme3 := [646, 130], nme4 := [652, 178], tstr
		, nme1chk, nme4chk := [677, 174, 0xFFBB00]

	while (WGImageSearch("Maps\4_3e\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 4-3E Map not zoomed out
		
	}
	ClickUntilPixelColor(EchF,, heli1, 27) ;Click Helipad until deploy screen
	
	if (mapDrag)
	{
		SwitchDPS()
		;Strike1: Stuck on close screen
		ClickUntilPixelColor(EchF,, heli1, 27)
	}

	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	;RandSleep(200,300)
	ClickUntilPixelColor(EchF,, heli2, 18)	;Deploy Second Helipad
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	;WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	Sleep 2000

	if (mapDrag)
		ResupplyDPS(heli1, 27)

	if (!mapDrag)
		ResupplyDPS(heli2, 15)
	else
	{
		RandSleep(300,450)
		RCtrlClick(heli2, 15)	;should replace with cupc with refnode
	}

	RandSleep(400,600)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	RCtrlClick(nme1,12)
	RandSleep(300,450)
	RCtrlClick(nme2,12)
	RandSleep(300,450)
	RCtrlClick(nme3,12)

	RandSleep(400,600)
	ControlSend,, a, %CSTitle%
	LookForClickClose(0.7)

	ClickUntilPixelColor(nme4chk,2,nme4,18)
	while(PixelNot(nme4chk))
		MsgBox LastChk failed
	
	if(MapDrag)
		LongWait += 20000
	Map_Execute(LongWait)

	RandSleep(1000,7500)	;testing large random wait
	Map_EndRoundFinal()
		
	return
}

0_2()
{
	local heli1 := [164, 324], heli2 := [412, 330], node1 := [314, 270], node2 := [336, 138]
		, node3 := [420, 254], node4 := [328, 194], node5 := [508, 192], LongWait := 70000
		, node6 := [624, 214], penumChk := [335, 166, 0xFFBB00]
		, lastChk := [624, 241, 0xFFBB00], helir := 21, noder := 12 ;27

	while (WGImageSearch("Maps\0_2\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 0-2 Map not zoomed out
		
	}
	ClickUntilPixelColor(EchF,, heli1, noder) ;Click Helipad until deploy screen
	
	if (mapDrag)
	{
		SwitchDPS()
		ClickUntilPixelColor(EchF,, heli1, noder)
	}

	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	;RandSleep(200,300)
	ClickUntilPixelColor(EchF,, heli2, helir)	;Deploy Second Helipad
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	;WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	Sleep 2000

	if (mapDrag)
	{
		ResupplyDPS(heli1, noder)
		RandSleep(300,450)
		RCtrlClick(heli2, helir)	;should replace with cupc with refnode
	} else
		ResupplyDPS(heli2, helir)

	RandSleep(400,600)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	Sleep 200
	while(PixelNot(penumChk))
		MsgBox penumChk failed

	Map_Execute(50000)
	Map_EndRound(2942, 4529)

	node2 := [337, 331], node3 := [421, 201], node4 := [329, 143], node5 := [509, 141] 
		, node6 := [623, 163], lastChk := [625, 191, 0xFFBB00] 
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
	RandSleep(500,750)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	ClickUntilPixelColor(lastChk,2,node6,helir)
	while(PixelNot(lastChk))
		MsgBox LastChk failed

	if(MapDrag)
		LongWait += 20000
	Map_Execute(LongWait)

/*
	local Supp1 := [336, 382], Supp2 := [412, 574]
	RandSleep(400,600)
	ClickUntilPixelColor(DepNightC,, Supp1, noder) ;Click Helipad until deploy screen
	ClickUntilPixelNot(EchSup,,EchSup,EchNumrx,EchNumry)
	WaitForPixelClick(EchSupClk, ecc)
	ClickUntilPixelNot(EchSupClk,,EchSupClk,EchSupClkrx,EchSupClkry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	RandSleep(400,600)
	ClickUntilPixelColor(DepNightC,, Supp2, helir) ;Click Helipad until deploy screen
	ClickUntilPixelNot(EchSup,,EchSup,EchNumrx,EchNumry)
	WaitForPixelClick(EchSupClk, ecc)
	ClickUntilPixelNot(EchSupClk,,EchSupClk,EchSupClkrx,EchSupClkry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
*/
	;RandSleep(1000,7500)	;testing large random wait
	Map_EndRoundFinal()
	
	return
}

EV1_2()
{
	local B1_2
	while(!PixelIs(NormalB))
	{
		RCtrlClick([476, ty], 135, 24)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(AutoBB,, NormalB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	local heli1, node1, node2, node3, node4, node5, noder := 15
	Map_EndRoundFinal()
	return
}
