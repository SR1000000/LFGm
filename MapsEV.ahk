
EventB := [56, 301, 0xC9D34F], EventPageChk := [90, 477, 0x473A1D], FirstChk := [117, 323, 0xD3E04A]
		, FirstB := [96, 322], FirstBr := 11, ThirdChk := [113, 399, 0xDCE94D, 0xD3E04A], ThirdB := [95, 399]
		, NormalEB := [403, 469, 0xFDB300], NormalEBChk := [403, 188, 0xFDB300]

;Crate farm 1-3		
EV1()
{
	local One := [322, 284], Onerx := 80, Onery := 40
	local Three := [320, 442]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(FirstChk,,FirstB,FirstBr)

	while(!PixelIs(NormalEB))
	{
		RCtrlClick(Three, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalEBChk,, NormalEB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [402, 270], node1 := [558, 580], helir:= 45, noder := 25, i := 0

	if(PixelNot(FairyOffB))	;turn Fairy off
		ClickUntilPixelColor(FairyOffB,,FairyOffB,7)

	Loop
	{
		if(i>0)
			Map_Restart()
		GuiControl,, Iter, % "Iter: " (i+1)
		DeployEch(heli1, helir)
		Map_StartOp()
		ResupplyDPS(heli1, helir)
		ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
		ClickUntilPixelNot(PlanChk2nn,,node1,noder)

		Map_Execute()
		i++
	} Until i>19
	Map_Terminate()
	return
}

EV2()	;CZ farm
{
	local One := [322, 284], Onerx := 80, Onery := 40
	local Three := [320, 442]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(FirstChk,,FirstB,FirstBr)

	while(!PixelIs(NormalEB))
	{
		RCtrlClick(One, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalEBChk,, NormalEB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [195, 229], node1 := [197, 582], node2 := [444, 419], helir:= 37, noder := 19, i := 0

	while (PixelNot([392, 228, 0xF9F9F9,0xFAFAFA,0xFBFBFB,0xFCFCFC,0xFDFDFD,0xFEFEFE0,xFFFFFF]))	;WGImageSearch("Maps\0_2\ChkZoomed",1,0,,,,,3))
	{
		MsgBox EV1-2 Map not zoomed out
		MouseMove, 392, 228
		
	}

	DeployEch(heli1, helir)
	Map_StartOp()
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
	ClickUntilPixelColor(PlanChk2t0,,node1,noder)
	ClickUntilPixelNot(PlanChk2t0,,node2,helir)

	Map_Execute()
	Map_EndRoundFinal()
	return
}

EV3()	;Groza farm E1-2
{
	local One := [322, 284], Onerx := 80, Onery := 40
	local Two := [624, 259]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(FirstChk,,FirstB,FirstBr)

	while(!PixelIs(NormalEB))
	{
		RCtrlClick(Two, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalEBChk,, NormalEB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [227, 333], node1 := [288, 612], helir:= 45, noder := 10, i := 0

	;if(!PixelNot(FairyOffB))
	;	ClickUntilPixelNot(FairyOffB,,FairyOffB,7)

	Loop
	{
		if(i>0)
			Map_Restart()
		GuiControl,, Iter, % "Iter: " (i+1)
		DeployEch(heli1, helir)
		Map_StartOp()
		ResupplyDPS(heli1, helir)
		ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
		ClickUntilPixelNot(PlanChk2nn,,node1,noder)

		Map_Execute()
		i++
	} Until i>4
	Map_Terminate()
	return
}

EV4()	;UmpExo farm E3-2
{
	local One := [322, 284], Onerx := 80, Onery := 40, Two := [623, 259], Three := [320, 442]

	WaitForPixelClick(EventB, ecc)
	ClickUntilPixelNot(EventB,,EventB,CombatTabrx,CombatTabry)

	WaitForPixelClick(EventPageChk,ecc)
	ClickUntilPixelColor(ThirdChk,,ThirdB,FirstBr)

	while(!PixelIs(NormalEB))
	{
		RCtrlClick(Two, Onerx, Onery)
		RandSleep(882,990)
	}
	ClickUntilPixelNot(NormalEBChk,, NormalEB, NormalBrx, NormalBry)
	
	if(!WaitForPixelClick(RedSangvis, 8)) ;Wait for active nodes screen (red sangvis icon)
	{
		MsgBox TDollList full, go enhance.  Exiting.
		CleanExit()
	}
	
	local heli1 := [401, 116], heli2, heli3, node1 := [354, 553], node2 := [444, 419]
		, helir:= 15, noder := 12, i := 0, LongWait := 80000

/*	while (PixelNot([392, 228, 0xF9F9F9,0xFAFAFA,0xFBFBFB,0xFCFCFC,0xFDFDFD,0xFEFEFE0,xFFFFFF]))	;WGImageSearch("Maps\0_2\ChkZoomed",1,0,,,,,3))
	{
		MsgBox EV3-2 Map not zoomed out
		MouseMove, 392, 228
		
	}	
*/
	if(PixelNot(FairyOffB))	;turn Fairy off
		ClickUntilPixelColor(FairyOffB,,FairyOffB,7)

	Loop
	{
		if(i>0)
			Map_Restart()
		GuiControl,, Iter, % "Iter: " (i+1)
		heli3 := [533, 411], heli2 := [384, 411]

		DeployEch(heli1,helir)
		DeployEch(heli2, noder)	;Deploy Second Helipad
		DeployEch(heli3, noder)	;Deploy Third Helipad

		Map_StartOp()
		ResupplyDPS(heli2, noder)
		ResupplyDPS(heli3, noder)
		
		ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)	;Click Planning
		ClickUntilPixelNot(PlanChk6,,node1,noder)
		ClickUntilPixelColor(PlanChkn4,,heli3,noder)
		
		Map_Execute(LongWait)
		heli3 := [520, 411], heli2 := [373, 411]
		RetreatEch(heli3,noder)
		RetreatEch(heli2,noder)
		i++
	} Until i>4
	Map_Terminate()
	return
}