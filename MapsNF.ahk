
1_6(farm := 0)	;Boss moves
{	
	local helir := 40, noder:= 20, heli1 := [292, 335], node1, node2 := []
		, node3, node4, node5, node6, node7, node8, nodeBoss, penumChk, lastChk
	
	if(farm)
	{
		heli1 := [172, 241], node2 := [], nodeBoss := [], helir := 21, noder := 12
		while (WGImageSearch("Maps\1_6\ChkZoomed",1,15,,,,,3))
			MsgBox 1-6 Map not zoomed out
	}	
	
	ClickUntilPixelColor(DepNightC,, heli1, helir)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()

	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	if(!farm)
	{
		CSend("e",900,1100)

		node2 := StrSplit(WGImageSearch("Maps\1_6\Boss",,5,,,,,1),",")
		node2 := [node2[1]-56, node2[2]-205]
	} else
	{
	}
	penumChk := PlanChk2nn
	ClickUntilPixelNot(penumchk,,node2,noder)

	Map_Execute(30000)
	Map_EndRound()

	node2 := [402, 337]
	ResupplyDPS(node2, noder)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	if(!farm)
	{
		;CSend("e",900,1100)
		;nodeBoss := StrSplit(WGImageSearch("Maps\1_6\Boss",,5,,,,,1),",")
		;nodeBoss := [nodeBoss[1]-40, nodeBoss[2]+23]
		nodeBoss := [408, 568]
	} else
	{
	}

	lastChk := PlanChk3nn 
	ClickUntilPixelNot(lastchk,,nodeBoss,helir)


	Map_Execute(10000)
	Map_EndRoundFinal()
	return
}

2_6()	;No Zoomout needed
{	
	local heli1 := [354, 336], node1 := [320, 147], node2 := [554, 323]
	, node3, nodeBoss := [738, 110], penumChk, lastChk, helir := 40, noder := 20

	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()

	;Click heli1
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	penumChk := PlanChk2t0
	ClickUntilPixelColor(penumchk,,node2,helir)

	Map_Execute(10000)
	Map_EndRound()

	node2 := [401, 337]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node2,noder)

	lastChk := PlanChk3t1
	ClickUntilPixelColor(lastchk,,nodeBoss,noder)

	Map_Execute(10000)
	Map_EndRoundFinal()
	return
}

3_6(farm := 0)
{
	local heli1 := [512, 326], heli2 := [68, 481], node1, node2, node3, nodeBoss, lastChk
		, helir := 40, noder := 21

	if(farm)
	{
		;heli1 := [663, 171], heli2 := [449, 247], helir := 18, noder := 9
		while (WGImageSearch("Maps\3_6\ChkZoomed",1,5,,,,,3))
			MsgBox 3-6 Map not zoomed out
	} 

	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Sleep 400
	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()
	
	ResupplyDPS(heli2, noder)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	if(!farm)
	{
		CSend("g",900,1100)
		CSend("g",500,700)
		nodeBoss := StrSplit(WGImageSearch("Maps\3_6\Boss",,5,,,,,1),",")
		nodeBoss[1] += -42
		nodeBoss[2] += 23
	} else 
	{
	
	}

	lastChk := PlanChk5t1
	ClickUntilPixelColor(lastChk,, nodeBoss, helir)
	
	Map_Execute(35000)
	
	Map_EndRoundFinal()

	return
}

4_6(farm := 0)
{	
	local heli1 := [505, 335], heli2, node1, node2, node3, nodeBoss, lastChk
		, helir := 30, noder := 12

	if(farm)
	{
		heli1 := [659, 475], helir := 18, noder := 9
		while (WGImageSearch("Maps\4_6\ChkZoomed",1,15,,,,,3))
			MsgBox 4-6 Map not zoomed out
	}

	ClickUntilPixelColor(DepNightC,, heli1, helir+noder) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	if(!farm)
	{
		CSend("a",900,1100)
		CSend("i",500,700)
		heli2 := StrSplit(WGImageSearch("Maps\4_6\Heli2",,15,,,,,1),",")
		heli2[1] += 0	;white x makes two different possible hits
		heli2[2] += 6	;safer click
	} else
	{
		CSend("z",900,1100)
		;heli2 := [693, 129], node1 := [541, 129], node2 := [433, 131], node3 := [297, 139]
		;	, node4 := [133, 135]
	}
	ClickUntilPixelColor(DepNightC,, heli2, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()
	
	ResupplyDPS(heli2,noder)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	if(!farm)
	{
		CSend("d",900,1100)

		nodeBoss := StrSplit(WGImageSearch("Maps\4_6\Boss",,5,,,,,1),",")
		nodeBoss := [nodeBoss[1]-43, nodeBoss[2]+28]
	} 

	lastChk := PlanChk4n0
	ClickUntilPixelNot(lastchk,,nodeBoss,helir)

	Map_Execute(60000)
	
	Map_EndRoundFinal()

	return
}

5_6(farm := 0)
{
	local heli1 := [514, 409], heli2, node1, node2, node2chk, node3, nodeBoss, lastchk, node3chk
		, helir := 45, noder := 21

	if(farm)
	{
		heli1 := [653, 516], helir := 18, noder := 9, lastchk := [165, 184, 0xFFBB00]
		while (WGImageSearch("Maps\5_6\ChkZoomed",1,15,,,,,3))
			MsgBox 5-6 Map not zoomed out
	}	

	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	if(!farm)
	{
		CSend("a",900,1100)
		CSend("i",500,700)
	
		heli2 := StrSplit(WGImageSearch("Maps\5_6\Heli2",,10,,,,,3),",")
		heli2[1] += 3
		heli2[2] += -21
		;node1 := [heli2[1]-264, heli2[2]-27]
	} else
	{
		;CSend("z",900,1100)
		;heli2 := [673, 142], node1 := [537, 128], node2 := [431, 164], node3 := [301, 144]
		;	, node3chk := [300, 165, 0xFFBB00], nodeBoss := [163, 164]
	}
	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad2 until deploy screen
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)	;Click Ech3b
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()
	
	ResupplyDPS(heli2,noder)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	if(!farm)
	{
		CSend("d",900,1100)

		nodeBoss := StrSplit(WGImageSearch("Maps\5_6\Boss",,5,,,,,1),",")

		nodeBoss[1] += -38
		nodeBoss[2] += 25
	} else
	{
		;node3chk := [301, 164, 0xFFBB00]
		;RandSleep(300,450)
		;RCtrlClick(node2,noder)
	}
	
	;RandSleep(100,250)
	;RCtrlClick(node3,noder) ;ClickUntilPixelColor(node3chk,2,node3,noder)	;Click node
	;RandSleep(100,250)
	lastChk := PlanChk4n0
	ClickUntilPixelNot(lastchk,,nodeBoss,helir)

	Map_Execute(30000)

	Map_EndRoundFinal()

	return
}

;need penumchk, lastchk
6_6(farm := 0)
{
	local heli1 := [212, 328], heli2, helir := 40, noder := 20
		, node1, node2, node3
		,node4,node5,node6,nodeBoss, penumChk, lastChk

	if(farm)
	{
		heli1 := [98, 166], node1 := [237, 165], node2 := [349, 167], node3 := [431, 171]
			, nodeBoss := [485, 289], helir := 18, noder := 9
		while (WGImageSearch("Maps\6_6\ChkZoomed",1,20,,,,,3))
			MsgBox 6-6 Map not zoomed out
	}

	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Map_StartOp()
	
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	if(!farm)
	{
		CSend("e",1100,1500)
		CSend("c",500,700)

		nodeBoss := StrSplit(WGImageSearch("Maps\6_6\Boss",,5,,,,,1),",")
		nodeBoss := [nodeBoss[1]-41, nodeBoss[2]+24]
		node3 := [nodeBoss[1]-99, nodeBoss[2]-230]
	} else
	{
	}

	penumChk := PlanChk3t0
	ClickUntilPixelColor(penumchk,,node3,noder)

	lastChk := penumChk
	ClickUntilPixelNot(lastChk,,nodeBoss,helir)

	Map_Execute(50000)
	
	Map_EndRoundFinal()
}

6_4E()
{
	local heli1 := [132, 493], helir := 18, noder := 9, safe := [228, 491]
		, node1 := [148, 429], node2 := [192, 357], node3 := [259, 303], node4 := [261, 237]
	while (WGImageSearch("Maps\6_4e\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 6-4E Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	Map_StartOp()
	
	ResupplyDPS(heli1, helir)
	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(2300,2450)
	RCtrlClick(safe,noder)
	
	RandSleep(300,450)
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	Map_EndRound(2000,2500)
	RandSleep(2000,2100)

	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	Sleep 2000
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	RandSleep(1500,2500)
	ResupplyDPS(heli1, helir)
	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(2300,2450)
	RCtrlClick(safe,noder)

	RandSleep(300,450)
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	Map_EndRound(2000,2500)

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(400,600)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	Map_Execute(20000)

	node1 := [147, 521], node2 := [191, 449], node3 := [259, 395], node4 := [261, 331]
		, node4b := [211, 329]
	RandSleep(1400,1600)
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(1500,1550)
	RCtrlClick(node3,noder)
	RandSleep(2500,3050)
	RCtrlClick(node4,noder)
	RandSleep(500,750)
	RCtrlClick(node4b,noder+2)
	Map_EndRound(2000,2500)
	
	node5 := [261, 247], node6 := [195, 163]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(400,600)
	RCtrlClick(node4,noder)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,noder)
	Map_Execute(20000)

	nodea := [259, 459], nodeb := [261, 393], nodec := [261, 309]
	RandSleep(1400,1600)
	RCtrlClick(nodea,noder)
	RandSleep(300,450)
	RCtrlClick(nodeb,noder)
	RandSleep(1500,1550)
	RCtrlClick(nodec,noder)
	RandSleep(2500,2550)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	Sleep 30000
	MsgBox 6-4e first half done
	
}