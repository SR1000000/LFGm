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
	else if (map == "6-3N")
		return "4=5 dummy Artillery Fairy`nAll dolls must be corpse, no HG"
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
		return "1=Dummy HG`n3=4HG`n55Max`n"
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
		return "1=Dummy HG w Para`n2=ARSMG`n3=BossKillers`n"
	else if (map == "EV1")
		return "1=AR15`nCrate farm EV1-3"
	else if (map == "EV2")
		return "1=Grizzly`nCZ farm EV1-1, 2 crates, Rescue"
	else if (map == "EV3")
		return "1=G11`nGroza farm EV1-2, Rescue"
	else if (map == "EV4")
		return "1=Dummy`n2=AntiGolyat`n3=G11VectorGrizzTendie`nUmpExo farm EV`nNeedPreZoomOut"
	else
		return %vWorld% . "`nMap Not Found"
}

MapInit(map)
{
	global mapDrag, SwapC, Carry43e, Carry02, Carry32n, Doll1, Doll2
	Carry := ""
	
	if (map == "4-3E")
		Carry := Carry43e
	else if (map == "0-2")
		Carry := Carry02
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
	global FairyActB,FairyActBb, FairyActBx, FairyActBy, FairyVated, FairyCD
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

;ASSUMES echelon on map selected so fairy activation is visible
;rb = 0 for red, 1 for blue
ActivateFairy(xy := 0, r := 0, rb := 0)
{
	global FairyActB,FairyActBb, FairyActBx, FairyActBy, FairyVated, FairyCD
	xy := xy ? xy : [-1,-1]	;parameters can't default to arrays - workaround
	color := rb ? FairyActBb : FairyActB

	ClickUntilPixelNot(color,,color,FairyActBx,FairyActBy)
	ClickUntilPixelNot(FairyVated,,xy,r)
	;RandSleep(1000,1000) ;not needed?
	if(rb)
	{
		ClickUntilPixelColor(FairyCD,,xy,r)
		RandSleep(1500,2500)
	}
	return
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
	else if (map == "0-2")
	{
		FocusChapter(0)
		ClickSubChapter(2)
		0_2()
	}
	else if (map == "6-3N")
	{
		FocusChapter(6,,1)
		ClickSubChapter(3)
		6_3N()
	}
	else if (map == "EV1")
		EV1()
	else if (map == "EV2")
		EV2()
	else if (map == "EV3")
		EV3()
	else if (map == "EV4")
		EV4()
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

;n is which number echelon, negative if one already deployed
DeployEch(heliXY,heliR := 10,n := 1)
{
	global RedSangvis, ecc, DepNightC
		, EchNum2, EchDep2, EchDep3, EchDep3b, EchDep4, EchDep5, EchNumrx, EchNumry, EchSup, EchSupClk
		, EchSupClkrx, EchSupClkry, DepOk, DepOkrx, DepOkry
	
	if(n == 1)
		EchDep := []
	else if (n == 2)
		EchDep := EchDep2
	else if (n == 3)
		EchDep := EchDep3
	else if (n == 4)
		EchDep := EchDep4
	else if (n == 5)
		EchDep := EchDep5
	else if (n == -3)
		EchDep := EchDep3b
	else
		MsgBox, Error in DeployEch, invalid n

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,-3, heliXY, heliR)	;Deploy Helipad
	if(EchDep.length())
		ClickUntilPixelColor(EchDep,, EchDep, EchNumrx, EchNumry)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	return
}

SelectEch(xy, r)
{
	global RedSangvis, ecc, SelectChk
	i := 0

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	While(!PixelIs(SelectChk))
	{
		RCtrlClick(xy,r)
		RandSleep(1100,1300)
		i++
		if(i>5)
			MsgBox, Error in SelectEch
	}
	return
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
;NoMid = 1 when no chance of midbattle requiring clicks
Map_Execute(LongWait := 15000, end := 0, NoMid := 0)
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
			while((!NoMid) && (!PixelIs(APTensDigit)))
			{
				i := 0
				DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
			}
			temp := WGImageSearch("PlanButton",1)
			if(temp)
			{
				NoMid ? (i += 2) : i++
				Sleep 1000
			} else
			{
				i := 0
				Sleep 5000
			}
		}
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
	return
}
Map_Terminate()
{
	global RedSangvis, ecc, RetHome, RetHomerx, RetHomery
	TerminateB := [199, 56], TerminateBr := 23, PushB := [495, 413, 0xF58237]
		, RestartBrx := 43, RestartBry := 16
	ClickUntilPixelColor(PushB,,TerminateB,TerminateBr)
	ClickUntilPixelNot(PushB,,PushB,Restartbrx,RestartBry)

	WaitForPixelClick(RetHome,ecc)
	ExpeditionCheck(RetHome)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
	return
}

RetreatEch(heliXY,heliR := 10)
{
	global ecc, DepNightC
	RetreatB := [628, 510, 0xE6E6E6]
	RetreatBrx := 41
	RetreatBry := 14
	RetreatOK := [474, 417, 0xFDB300]

	ClickUntilPixelColor(DepNightC,, heliXY, heliR)	;Takes two clicks
	WaitForPixelClick(RetreatB,ecc)
	ClickUntilPixelNot(DepNightC,,RetreatB,RetreatBrx,RetreatBry)
	WaitForPixelClick(RetreatOK,ecc)
	ClickUntilPixelNot(RetreatOK,,RetreatOK,38,17)
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

	DeployEch(heli2, 18)	;Deploy Second Helipad

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

	DeployEch(heli1, helir)	;Deploy Second Helipad

/*
	if(RescueFairy())
	{
		if(!PixelNot(FairyOffB))
			ClickUntilPixelNot(FairyOffB,,FairyOffB,7)
	}
	else if(PixelNot(FairyOffB))	;turn Fairy off
		ClickUntilPixelColor(FairyOffB,,FairyOffB,7)
*/
	if (mapDrag)
	{
		Safexy := [450, 500], Safexyr := 50
		ResupplyDPS(heli1, noder)
		RandSleep(300,450)
		RCtrlClick(Safexy, Safexyr)
		RandSleep(300,450)
		SelectEch(heli2, helir)	
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
	Map_Execute(LongWait,1,1)
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

;only airstrike version for now
6_3N()
{
	local heli1 := [292, 215], node1 := [624, 228], LongWait := 25000, helir := 30, noder := 20
		, lastChkN := PlanChk2t0, i :=0

	if(!PixelNot(FairyOffB))
		ClickUntilPixelNot(FairyOffB,,FairyOffB,7)
	MsgBox, Zoomout Pls
	Loop
	{
		if(i>0)
			Map_Restart()
		GuiControl,, Iter, % "Iter: " (i+1)

		DeployEch(heli1,helir,4)
		Map_StartOp()

		WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
		SelectEch(heli1, helir)
		ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning

		ClickUntilPixelColor(lastChkN,,node1,noder)

		Map_Execute(LongWait,,1)
		RandSleep(0,7000)
		i++
	} Until i>9
	
	Map_Terminate()
	
	return
}

