
1_6(farm := 0)	;Boss moves, need prezoomout
{	
	local helir := 21, noder:= 12, heli1 := [172, 241], node1 := [304, 239]
		, node2 := [236, 347]
		, node3, node4, node5, node6, node7, node8, node9, refnode

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	while (WGImageSearch("Maps\1_6\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 1-6 Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)

	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 4000

	node2 := [234, 329], node3 := [330, 441], node4 := [498, 337]

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 2000

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
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 5000
	WGImageSearch("PlanButton",-120)

	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 3000

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
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
	return
}

2_6(farm := 0)	;No Zoomout needed
{	
	local heli1 := [355, 331], node1 := [313, 118], node2 := [556, 319]
	, node3 := [742, 259], node4 := [760,94]

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
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
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 3000

	node2 := [403, 331]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node2,21)
	RandSleep(300,450)
	RCtrlClick(node3,21)
	RandSleep(300,450)
	RCtrlClick(node4,21)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
	return
}

3_6(farm := 0)
{
	local heli1 := [514,322], heli2 := [79, 478], node1, node2, node3, node4, node4Chk
		, helir := 45, noder := 21

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	if(farm)
	{
		heli1 := [663, 171], heli2 := [449, 247], helir := 18, noder := 9
		while (WGImageSearch("Maps\3_6\ChkZoomed",1,5,,,,,3))
			MsgBox 3-6 Map not zoomed out
	} 

	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Sleep 400
	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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
;	if(PixelNot(node4Chk))
	RCtrlClick(node4,helir)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 30000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)

	return
}

4_6(farm := 0)
{	
	local heli1 := [505, 331], heli2, node1, node2, node3, node4, helir := 21, noder := 12

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	if(farm)
	{
		heli1 := [659, 475], helir := 18, noder := 9
		while (WGImageSearch("Maps\4_6\ChkZoomed",1,5,,,,,3))
			MsgBox 4-6 Map not zoomed out
	} 
	ClickUntilPixelColor(DepNightC,, heli1, helir+noder) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	;Strike 1: DepOK not clicked, how?

	RandSleep(900,1100)
	ControlSend, , a, %CSTitle%
	LookForClickClose(0.7)
	if(!farm)
	{
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
		heli2 := [693, 129], node1 := [541, 129], node2 := [433, 131], node3 := [297, 139]
			, node4 := [133, 135]
	}
	ClickUntilPixelColor(DepNightC,, heli2, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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
		node2[1] += 6
		node2[2] += -18
		node3 := [node2[1]-285, node2[2]+15]
		node4 := [node2[1]-606, node2[2]+9]
	} else
	{
		RandSleep(300,450)
	}
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,helir)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 60000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)

	return
}

5_6(farm := 0)
{
	local heli1 := [514, 409], heli2, node1, node2, node2chk, node3, node4
		, helir := 45, noder := 21

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	if(farm)
	{
		heli1 := [653, 516], helir := 18, noder := 9
		while (WGImageSearch("Maps\5_6\ChkZoomed",1,5,,,,,3))
			MsgBox 5-6 Map not zoomed out
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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
			, node4 := [163, 164]
	}
	ClickUntilPixelColor(DepNightC,, heli2, noder) ;Click Helipad2 until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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
		node2chk := [node4[1]+477, node4[2]+45, 0xFFBB00]
		node4[1] += -42
		node4[2] += 27
		node3 := [node4[1]+268, node4[2]-36]
		node2 := [node4[1]+519, node4[2]]
		if(PixelNot(node2chk))	;swipe may have clicked node
			RCtrlClick(node2,noder)	;Click node
	} else
	{
		RandSleep(300,450)
		RCtrlClick(node2,noder)
	}
	
	RandSleep(300,450)
;Strike 1: noclick on node3, fix: node3 offsets above were off?
	RCtrlClick(node3,noder)	;Click node
	RandSleep(300,450)
	RCtrlClick(node4,helir)	;Click node
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 30000
	WGImageSearch("PlanButton",-120)

	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)

	return
}

6_6(farm := 0)	;Need preZoomout
{
	local heli1 := [96, 163], heli2 := [712, 145], helir := 18, noder := 9
		, node1 := [237, 165], node2 := [349, 167], node3 := [431, 169]
		, node4,node5,node6,node7

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	while (WGImageSearch("Maps\6_6\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 1-6 Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc)
	ClickUntilPixelColor(PlanChk,, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)
	
	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

/*
	RandSleep(400,600)
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	Sleep 200
	RCtrlClick(EchSup,EchNumrx,EchNumry)
	WaitForPixelClick(EchSupClk, ecc)
	ClickUntilPixelNot(EchSupClk,,EchSupClk,EchSupClkrx,EchSupClkry)
	WaitForPixelClick(DepOk, ecc)
	ClickUntilPixelNot(DepOK,, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	RandSleep(987,1353)
	FriendStandby(heli1,helir)
*/
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	RandSleep(2000,2500)

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	node4:= [389, 243], node5 := [344, 365], node6 := [466, 387], node7 := [486, 287]
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,noder)
	RandSleep(300,450)
	RCtrlClick(node7,helir)
	RandSleep(400,600)
	ClickUntilPixelNot(PlanB,,ExecuteB,ExecuteBrx,ExecuteBry)
	
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 30000
	WGImageSearch("PlanButton",-180)
	
	RandSleep(EndRoundWmin,EndRoundWmax)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc)
	ClickUntilPixelNot(RetHome,,RetHome,RetHomerx,RetHomery)
}
