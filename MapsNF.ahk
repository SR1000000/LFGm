
1_6()	;Boss moves, need prezoomout
{	
	local helir := 21, noder:= 12, heli1 := [172, 241], node1 := [304, 239]
		, node2 := [236, 347]
		, node3, node4, node5, node6, node7, node8, node9, refnode

	while (WGImageSearch("Maps\1_6\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 1-6 Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)

	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	Map_Execute(10000)
	Map_EndRound()

	node2 := [234, 329], node3 := [330, 441], node4 := [498, 337]

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	Map_Execute(10000)
	Map_EndRound()

	;need refnode?
	node4 := StrSplit(WGImageSearch("Maps\1_6\BlueRef",,0,,,,,1),",")
	node4 := [node4[1]+204, node4[2]+120]
	, node5 := [370, node4[2]-6], node6 := [472, node4[2]-112], node7 := [582, node4[2]-58] 
	ResupplyDps(node4,noder)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,noder)
	RandSleep(300,450)
	RCtrlClick(node7,noder)
	Map_Execute(5000)
	Map_EndRound()

	;need refnode for chasing boss
	;refnode := StrSplit(WGImageSearch("Maps\1_6\Enemy2",,5,403,283,,,3),",")
	;node9 := [refnode[1]-165, refnode[2]-180]
	node7 := [584, 291], node8 := [570, 411], node9 := [502, 487]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node7,noder)
	RandSleep(300,450)
	RCtrlClick(node8,noder)
	RandSleep(300,450)
	RCtrlClick(node9,helir)

	Map_Execute(10000)
	Map_EndRoundFinal()
	return
}

2_6()	;No Zoomout needed
{	
	local heli1 := [355, 331], node1 := [313, 118], node2 := [556, 319]
	, node3 := [742, 259], node4 := [760,94], lastChk

	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)

	;Click heli1
	ResupplyDPS(heli1, 36)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node1,21)
	RandSleep(300,450)
	RCtrlClick(node2,21)
	Map_Execute(10000)
	Map_EndRound()

	node2 := [403, 331]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node2,21)
	RandSleep(300,450)
	RCtrlClick(node3,21)
	RandSleep(300,450)
	RCtrlClick(node4,21)
	Map_Execute(10000)
	Map_EndRoundFinal()
	return
}

3_6(farm := 0)
{
	local heli1 := [514,322], heli2 := [79, 478], node1, node2, node3, node4, lastChk
		, helir := 45, noder := 21

	if(farm)
	{
		heli1 := [663, 171], heli2 := [449, 247], helir := 18, noder := 9
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

	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2, noder)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , g, %CSTitle%
		LookForClickClose(0.7)
		node2 := StrSplit(WGImageSearch("Maps\3_6\Enemy1",,5,,,420,500,2),",")
		node1 := [node2[1]-96, node2[2]-214]
		node2 := [node2[1]-288, node2[2]+4]
	} else 
	{
		node1 := [355, 257], node2 := [257, 363]
		RandSleep(300,450)
	}
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,15)

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , g, %CSTitle%
		LookForClickClose(0.7)
		node4 := StrSplit(WGImageSearch("Maps\3_6\Boss",,5,,,,,1),",")
		node4Chk := [node4[1]-39, node4[2]+66, 0xFFBB00]
		node4[1] += -52
		node4[2] += 22
		node3 := [node4[1]-162, node4[2]-108]
	} else
	{
		node3 := [241, 477], node4 := [325, 533]
		RandSleep(300,450)
	}
	RCtrlClick(node3,noder)
	RandSleep(300,450)
;	if(PixelNot(lastChk))
	RCtrlClick(node4,helir)
	Map_Execute(30000)
	
	Map_EndRoundFinal()

	return
}

4_6(farm := 0)
{	
	local heli1 := [505, 331], heli2, node1, node2, node3, node4, lastChk
		, helir := 21, noder := 12

	if(farm)
	{
		heli1 := [659, 475], helir := 18, noder := 9
		while (WGImageSearch("Maps\4_6\ChkZoomed",1,5,,,,,3))
			MsgBox 4-6 Map not zoomed out
	} 
	ClickUntilPixelColor(DepNightC,, heli1, helir+noder) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , a, %CSTitle%
		LookForClickClose(0.7)
		RandSleep(500,700)
		ControlSend, , i, %CSTitle%
		LookForClickClose(0.7)
		heli2 := StrSplit(WGImageSearch("Maps\4_6\Heli2",,5,,,,,1),",")
		heli2[1] += 0	;white x makes two different possible hits
		heli2[2] += 27	;safer click
		node1 := [heli2[1]-312, heli2[2]]
		node2 := [heli2[1]-537, heli2[2]+6]
	} else
	{
		RandSleep(900,1100)
		ControlSend, , z, %CSTitle%
		LookForClickClose(0.7)
		heli2 := [693, 129], node1 := [541, 129], node2 := [433, 131], node3 := [297, 139]
			, node4 := [133, 135]
	}
	ClickUntilPixelColor(DepNightC,, heli2, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2,noder)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	RandSleep(300,450)
	RCtrlClick(node1,noder)	;Click node1

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , d, %CSTitle%
		LookForClickClose(0.7)

		node2 := StrSplit(WGImageSearch("Maps\4_6\Enemy1",,5,540,,,304,3),",")
		lastChk := [node2[1]-614, node2[2]+24, 0xFFBB00]
		node2[1] += 6
		node2[2] += -18
		node3 := [node2[1]-285, node2[2]+15]
		node4 := [node2[1]-606, node2[2]+9]
	} else
	{
		lastChk := [141, 153, 0xFFBB00]
		RandSleep(300,450)
	}
	RCtrlClick(node2,noder)
	RandSleep(300,450)
;Strike1: failed click on node3
	RCtrlClick(node3,noder)
	RandSleep(200,350)
	ClickUntilPixelColor(lastchk,,node4,helir)
	Map_Execute(60000)
	
	Map_EndRoundFinal()

	return
}

5_6(farm := 0)
{
	local heli1 := [514, 409], heli2, node1, node2, node2chk, node3, node4, lastchk, node3chk
		, helir := 45, noder := 21

	if(farm)
	{
		heli1 := [653, 516], helir := 18, noder := 9, lastchk := [165, 184, 0xFFBB00]
		while (WGImageSearch("Maps\5_6\ChkZoomed",1,5,,,,,3))
			MsgBox 5-6 Map not zoomed out
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , a, %CSTitle%
		LookForClickClose(0.7)
		RandSleep(500,700)
		ControlSend, , i, %CSTitle%
		LookForClickClose(0.7)
	
		heli2 := StrSplit(WGImageSearch("Maps\5_6\Heli2",,5,,,,,3),",")
		heli2[1] += 3
		heli2[2] += -21
		node1 := [heli2[1]-264, heli2[2]-27]
	} else
	{
		RandSleep(900,1100)
		ControlSend, , z, %CSTitle%
		LookForClickClose(0.7)
		heli2 := [673, 142], node1 := [537, 128], node2 := [431, 164], node3 := [301, 144]
			, node3chk := [300, 165, 0xFFBB00], node4 := [163, 164]
	}
	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad2 until deploy screen
	ClickUntilPixelColor(EchDep3b,, EchDep3b, EchNumrx, EchNumry)	;Click Ech3b
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2,noder)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	RandSleep(300,450)
	RCtrlClick(node1,noder)	;Click node

	if(!farm)
	{
		RandSleep(900,1100)
		ControlSend, , d, %CSTitle%
		LookForClickClose(0.7)

		node4 := StrSplit(WGImageSearch("Maps\5_6\Boss",,5,,,,,1),",")
		lastchk := [node4[1]-42, node4[2]+67, 0xFFBB00]
		node2chk := [node4[1]+477, node4[2]+45, 0xFFBB00]
		node4[1] += -42
		node4[2] += 27
		node3 := [node4[1]+268, node4[2]-36]
		node2 := [node4[1]+519, node4[2]]
		if(PixelNot(node2chk))	;swipe may have clicked node
			RCtrlClick(node2,noder)	;Click node
	} else
	{
		node3chk := [301, 164, 0xFFBB00]
		RandSleep(300,450)
		RCtrlClick(node2,noder)
	}
	
	RandSleep(100,250)
	RCtrlClick(node3,noder) ;ClickUntilPixelColor(node3chk,2,node3,noder)	;Click node
	RandSleep(100,250)
	ClickUntilPixelColor(lastchk,3,node4,helir)
	while(PixelNot(lastchk))
		MsgBox LastChk failed
	Map_Execute(30000)

	Map_EndRoundFinal()

	return
}

6_6()	;Need preZoomout
{
	local heli1 := [96, 163], heli2 := [712, 145], helir := 18, noder := 9
		;, node1 := [237, 165], node2 := [349, 167], node3 := [431, 169]
		, node1 := [301, 164], node2 := [192, 226], node3 := [282, 266]
		, node4:= [389, 243],node5,node6,node7

	while (WGImageSearch("Maps\6_6\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 6-6 Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)
	
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	;RandSleep(300,450)
	;RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	Map_Execute(10000)

	RandSleep(400,600)
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	ClickUntilPixelNot(EchSup,,EchSup,EchNumrx,EchNumry)
	WaitForPixelClick(EchSupClk, ecc)
	ClickUntilPixelNot(EchSupClk,,EchSupClk,EchSupClkrx,EchSupClkry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepNightC,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	RandSleep(987,1353)
	FriendStandby(heli1,helir)

	Map_EndRound(2000,4000)

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	node4:= [389, 243], node5 := [344, 365], node6 := [466, 387], node7 := [486, 287]
	;RandSleep(300,450)
	;RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,noder)
	RandSleep(300,450)
	RCtrlClick(node7,helir)
	Map_Execute(30000)
	
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
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)
	
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