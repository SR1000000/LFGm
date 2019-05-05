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
	else if (map == "EV1")
		return "1=GrizzlyWelrod`nCrate farm EV1-3"
	else if (map == "EV2")
		return "1=Grizzly`nCZ farm EV1-1, 2 crates, Rescue"
	else if (map == "EV3")
		return "1=GrizzlyWelrod`n"
	else
		return %vWorld% . "`nMap Not Found"
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

;apply Rescue fairy to node supplied node if Rescue equipped
;return 1/0 on if Rescue is equipped
;ASSUMES echelon on map selected so fairy activation is visible
;leaves xy echelon selected on exit
RescueFairy(xy := 0, r := 0)
{
	FairyActB := [761, 284, 0x4E6282], FairyActBx := 24, FairyActBy := 9
	FairyVated := [762, 278, 0xDCDDDD], FairyCD := [759, 278, 0x9D9D9D]
	;xy := xy ? xy : [-1,-1]	;parameters can't default to arrays - workaround
	tf := WGImageSearch("RescueFairy",1,,700,180,800,260)

	if (tf)
	{
		if (xy)
		{
			ClickUntilPixelNot(FairyActB,,FairyActB,FairyActBx,FairyActBy)
			ClickUntilPixelNot(FairyVated,,xy,r)
			;RandSleep(1000,1000) ;not needed?
			ClickUntilPixelColor(FairyCD,,xy,r)
		}
		return 1
	}
	return 0
}

RunMap(map)
{
	global
	CombatClick()
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
	else if (map == "EV1")
		EV1()
	else if (map == "EV2")
		EV2()
	else if (map == "EV3")
		EV3()
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
		CombatClick()
		FocusChapter(2)
		ClickSubChapter(6)
		2_6()
		ExpeditionCheck(Home)
		CombatClick()
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
		CombatClick()
		FocusChapter(5)
		ClickSubChapter(6)
		5_6()
		ExpeditionCheck(Home)
		CombatClick()
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

CombatClick()
{
	global
	ClickUntilPixelNot(Combat,,Combat,51,29)
	GuiControl,, StatA, Waiting for CombatTab PC %ClickCount%
	WaitForPixelClick(RetHome, ecc)
	GuiControl,, StatA, Waiting for CombatTab PC to Correct Color %ClickCount%
	ClickUntilPixelColor(CombatTab,, CombatTab, CombatTabrx, CombatTabry)
	WaitForPixelClick(CombatChk, ecc) ;WaitFor the white Sangvis icons to appear

}

FocusChapter(x,e := 0, n := 0)
{
	global ecc, EmerChk, EmerB, EmerBr
	NormChk := [688, 104, 0xFFB400], NormB := [618, 145]
		, NightChk := [686, 104, 0x114C67], NightB := [760, 145]
	ty := 122+(64*x)
	GuiControl,, StatA, Waiting for Chapter PC %ClickCount%
	CSend("h")
	;Sleep 500
	ClickUntilPixelColor([157, ty, 0xFFB400],, [157, ty], 23)

	if(e)
		ClickUntilPixelColor(EmerChk,, EmerB, EmerBr)
	else if(n)	
		ClickUntilPixelColor(NightChk,, NightB, EmerBr) 
	else
	{
		ClickUntilPixelNot(EmerChk,, NormB, EmerBr)
		ClickUntilPixelNot(NightChk,, NormB, EmerBr)
	}
	return
}

ClickSubChapter(x)
{
	global NormalB, NormalBrx, NormalBry, NormalBChk, RedSangvis, CombatChk
	WaitForPixelClick(CombatChk, ecc) ;WaitFor the white Sangvis icons to appear
	ty := 128 + (75*x)
	while(!PixelIs(NormalB))
	{
		RCtrlClick([476, ty], 135, 24)
		RandSleep(413,590)
	}
	ClickUntilPixelNot(NormalBChk,, NormalB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
}
Map_StartOp(s := 2000)
{	
	global 
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(APTensDigit,, StartOp, StartOprx, StartOpry,1)	;click start operations
	RandSleep(s,Floor(s*1.5))
	return
}
;end = 1 when multiturn planning ends mission by itself
Map_Execute(LongWait := 15000, end := 0)
{
	local temp, i := 0
	RandSleep(400,600)
	while(PixelIs(PlanB))
	{
		RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
		Sleep 2000
		i++
		if(i>5)
			MsgBox, Error in Map_Execute
	}
	;ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep %LongWait%

	if(end)
	{
		WaitForPixelClick(FinMission,-120)
	} else
	{
		i := 0
		while(i<4)
		{
			while(!PixelIs(APTensDigit))
			{
				i := 0
				DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
			}
			temp := WGImageSearch("PlanButton",1)
			if(temp)
			{
				i++
				Sleep 1000
			} else
				i := 0
		}
/*		Loop
		{
			if(PixelIs(APTensDigit))
			{
				WGImageSearch("PlanButton",-120)
				Sleep 4000
				temp := WGImageSearch("PlanButton",1)
			}
;Strike 1: PlanButton flashes too quickly, gets stuck on WGIS(PB) when it should be in DTUT
;Attempted Fix: planbsearch only if aptensdigit
			if(!temp)
				DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
		} Until temp	
*/
	} 
	return
}
Map_EndRound(Wmin := 3942, Wmax := 7529)	
{
	global
	;RandSleep(Wmin,Wmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	RandSleep(2449,3664)
	return
}
Map_EndRoundFinal()
{
	global
	;RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	ExpeditionCheck(RetHome) ;WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
	return
}

Map_Restart()
{
	global RedSangvis, ecc
	TerminateB := [199, 56], TerminateBr := 23, RestartB := [305, 413, 0xDB3E3E]
		, RestartBrx := 43, RestartBry := 16
	ClickUntilPixelColor(RestartB,,TerminateB,TerminateBr)
	ClickUntilPixelNot(RestartB,,RestartB,Restartbrx,RestartBry)
	WaitForPixelClick(RedSangvis,ecc)
	return
}

;need update
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

	CSend("a",500,800)

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
	local heli1 := [164, 324], heli2 := [412, 330], node2 := [337, 382], LongWait := 90000
		, node4 := [330, 196], node6 := [619, 215], node7 := [669, 319], helir := 30, noder := 20
		, penumChk := PlanChk2nn, lastChkN := PlanChkn2n

	while (PixelNot([508, 237, 0xF9F9F9,0xFAFAFA,0xFBFBFB,0xFCFCFC,0xFDFDFD,0xFEFEFE0,xFFFFFF]))	;WGImageSearch("Maps\0_2\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 0-2 Map not zoomed out
		MouseMove, 508, 237
		
	}

	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad until deploy screen
	
	if (mapDrag)
	{
		SwitchDPS()
		ClickUntilPixelColor(DepNightC,, heli2, noder)
	}

	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, helir)	;Deploy Second Helipad
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	if (mapDrag)
	{
		ResupplyDPS(heli1, noder)
		RandSleep(300,450)
		RCtrlClick(heli2, helir)	;should replace with cupc with refnode
	} else
		ResupplyDPS(heli2, helir)

	CSend("a")
	RandSleep(400,600)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

	ClickUntilPixelNot(penumChk,2,node4,noder)

	while(PixelIs(penumChk))
		MsgBox penumChk failed

	ClickUntilPixelNot(lastChkN,2,node7,helir)

	while(PixelIs(lastChkN))
		MsgBox LastChk failed

	if(MapDrag)
		LongWait += 20000
	Map_Execute(LongWait,1)
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
	Map_EndRoundFinal()
	
	return
}

EV1()
{
	local EventB := [56, 301, 0xC9D34F], EventPageChk := [90, 477, 0x473A1D], FirstChk := [117, 323, 0xDCE94D]
		, FirstB := [96, 322], FirstBr := 11
	local One := [322, 284], Onerx := 80, Onery := 40
	local Three := [320, 442]
	local NormalB := [403, 469, 0xFDB300], NormalBChk := [403, 188, 0xFDB300]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(FirstChk,,FirstB,FirstBr)

	while(!PixelIs(NormalB))
	{
		RCtrlClick(Three, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalBChk,, NormalB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [402, 270], node1 := [558, 580], helir:= 45, noder := 25, i := 0

	Loop
	{
		if(i>0)
			Map_Restart()
		ClickUntilPixelColor(DepNightC,, heli1, helir)
		ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
		Map_StartOp()
		ResupplyDPS(heli1, helir)
		ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
		ClickUntilPixelNot(PlanChk2nn,,node1,noder)

		Map_Execute()
		i++
	} Until i>25
	;Map_EndRoundFinal()
	return
}

EV2()
{
	local EventB := [56, 301, 0xC9D34F], EventPageChk := [90, 477, 0x473A1D], FirstChk := [117, 323, 0xDCE94D, 0xD3E04A]
		, FirstB := [96, 322], FirstBr := 11
	local One := [322, 284], Onerx := 80, Onery := 40
	local Three := [320, 442]
	local NormalB := [403, 469, 0xFDB300], NormalBChk := [403, 188, 0xFDB300]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(FirstChk,,FirstB,FirstBr)

	while(!PixelIs(NormalB))
	{
		RCtrlClick(One, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalBChk,, NormalB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [195, 229], node1 := [197, 582], node2 := [444, 419], helir:= 37, noder := 19, i := 0

	while (PixelNot([392, 228, 0xF9F9F9,0xFAFAFA,0xFBFBFB,0xFCFCFC,0xFDFDFD,0xFEFEFE0,xFFFFFF]))	;WGImageSearch("Maps\0_2\ChkZoomed",1,0,,,,,3))
	{
		MsgBox EV2 Map not zoomed out
		MouseMove, 392, 228
		
	}

	ClickUntilPixelColor(DepNightC,, heli1, helir)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	Map_StartOp()
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
	ClickUntilPixelColor(PlanChk2t0,,node1,noder)
	ClickUntilPixelNot(PlanChk2t0,,node2,helir)

	Map_Execute()
	Map_EndRoundFinal()
	return
}

EV3()
{

	return
}