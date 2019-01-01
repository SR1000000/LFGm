
1_6()	;Boss moves, need prezoomout
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
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)

	ResupplyDPS(heli1, helir)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node1,noder)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 4000

	node2 := [234, 329], node3 := [330, 441], node4 := [498, 337]	;Boss moved up

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node2,noder)
	RandSleep(300,450)
	RCtrlClick(node3,noder)

	;node4 := StrSplit(WGImageSearch("Maps\1_6\Enemy2",,5,480,350,,,3),",")
	;node4 := [node4[1]-298, node4[2]-146]
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 2000

	;need refnode
	MsgBox need refnode for when boss didn't move up
	node4 := [498, 329], node5 := [370, 323], node6 := [472, 217], node7 := [582, 269] ;Boss moved down
	ResupplyDps(node4,noder)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,noder)
	RandSleep(300,450)
	RCtrlClick(node7,noder)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 5000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 3000

	;Boss was down, moved up
	node7 := [584, 291], node8 := [570, 411], node9 := [502, 487]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node7,noder)
	RandSleep(300,450)
	RCtrlClick(node8,noder)

	;refnode := StrSplit(WGImageSearch("Maps\1_6\Enemy2",,5,403,283,,,3),",")
	;node9 := [refnode[1]-165, refnode[2]-180]
	RandSleep(300,450)
	RCtrlClick(node9,helir)
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

2_6()	;No Zoomout needed
{	
	local heli1 := [355, 331], node1 := [313, 118], node2 := [556, 319]
	, node3 := [742, 259], node4 := [760,94]

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2300)

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

3_6()
{
	local heli1 := [514,322], heli2 := [79, 478], node1, node2, node3, node4, node4Chk

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)

	ClickUntilPixelColor(DepNightC,, heli1, 45) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	Sleep 400
	ClickUntilPixelColor(DepNightC,, heli2, 21) ;Click Helipad until deploy screen
;Issue: Skipping heli2 click
;Attempted fix: longer pause before clickcheck
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2, 21)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(900,1100)
	ControlSend, , g, %CSTitle%
	LookForClickClose(0.7)

	node2 := StrSplit(WGImageSearch("Maps\3_6\Enemy1",,5,,,420,480,2),",")
	node2[1] += 6
	node2[2] += -26
	node1 := [node2[1]+234, node2[2]+56]
	RCtrlClick(node1,21)
	RandSleep(300,450)
	RCtrlClick(node2,21)

	RandSleep(900,1100)
	ControlSend, , b, %CSTitle%
	LookForClickClose(0.7)
	
	node4 := StrSplit(WGImageSearch("Maps\3_6\Boss",,5,,,,,1),",")
	node4Chk := [node4[1]-39, node4[2]+66, 0xFFBB00]
	node4[1] += -42
	node4[2] += 27
	node3 := [node4[1]+87, node4[2]-204]
	RCtrlClick(node3,21)
	RandSleep(300,450)
;	if(PixelNot(node4Chk))
	RCtrlClick(node4,45)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 50000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)

	return
}

4_6()
{	
	local heli1 := [505, 331], heli2, node1, node2, node3, node4

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 45) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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

	ClickUntilPixelColor(DepNightC,, heli2, 21) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2, 12)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	RandSleep(300,450)
	RCtrlClick(node1,12)	;Click node1

	RandSleep(900,1100)
	ControlSend, , d, %CSTitle%
	LookForClickClose(0.7)

	node2 := StrSplit(WGImageSearch("Maps\4_6\Enemy1",,5,540,,,304,3),",")
	node2[1] += 6
	node2[2] += -18
	node3 := [node2[1]-285, node2[2]+15]
	node4 := [node2[1]-606, node2[2]+9]
	RCtrlClick(node2,12)
	RandSleep(300,450)
	RCtrlClick(node3,12)
	RandSleep(300,450)
	RCtrlClick(node4,21)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 60000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(400,600)
	ClickUntilPixelNot(APTensDigit,,EndRoundB,EndRoundBrx,EndRoundBry)
	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)

	return
}

5_6()
{
	local heli1 := [514, 409], heli2, node1, node2, node2chk, node3, node4

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 45) ;Click Helipad until deploy screen
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

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

	ClickUntilPixelColor(DepNightC,, heli2, 21) ;Click Helipad2 until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(2000,2500)
	
	ResupplyDPS(heli2, 21)	;leaves heli2 clicked
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	
	RandSleep(300,450)
	RCtrlClick(node1,21)	;Click node

	RandSleep(900,1100)
	ControlSend, , d, %CSTitle%
	LookForClickClose(0.7)

	node4 := StrSplit(WGImageSearch("Maps\5_6\Boss",,5,,,,,1),",")
	node2chk := [node4[1]+477, node4[2]+45, 0xFFBB00]
	node4[1] += -42
	node4[2] += 27
	node3 := [node4[1]+225, node4[2]-12]
	node2 := [node4[1]+519, node4[2]]
	
	if(PixelNot(node2chk))	;swipe may have clicked node
		RCtrlClick(node2,21)	;Click node
	RandSleep(300,450)
	RCtrlClick(node3,21)	;Click node
	RandSleep(300,450)
	RCtrlClick(node4,45)	;Click node
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 30000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)

	return
}

6_6()	;Need preZoomout
{
	local heli1 := [96, 163], heli2 := [712, 145], helir := 18, noder := 9
		, node1 := [192, 227], node2 := [282, 267], node3 := [390, 243]
		, node4,node5,node6

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	while (WGImageSearch("Maps\6_6\ChkZoomed",1,0,,,,,3))
	{
		MsgBox 1-6 Map not zoomed out
		
	}
	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
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
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)
	RandSleep(400,600)

	ClickUntilPixelColor(DepNightC,, heli1, helir) ;Click Helipad until deploy screen
	Sleep 200
	RCtrlClick(EchSup,EchNumrx,EchNumry)
	WaitForPixelClick(EchSupClk, ecc)
	ClickUntilPixelNot(EchSupClk,,EchSupClk,EchSupClkrx,EchSupClkry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	FriendStandby(heli1,helir)
	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	RandSleep(2000,2500)

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	node4 := [344, 365], node5 := [466, 387], node6 := [486, 287]
	RandSleep(300,450)
	RCtrlClick(node3,noder)
	RandSleep(300,450)
	RCtrlClick(node4,noder)
	RandSleep(300,450)
	RCtrlClick(node5,noder)
	RandSleep(300,450)
	RCtrlClick(node6,helir)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)
	
	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 20000
	WGImageSearch("PlanButton",-120)
	
	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)

	WaitForPixelClick(FinMission,ecc)	;WaitFor Mission End Stats Image
	RandSleep(FinMisPreWaitMin,FinMisPreWaitMax)
	ClickUntilImage("LoadScreen",-10,Safe,Saferx,Safery)
	WaitForPixelClick(RetHome,ecc,RetHome,RetHomerx,RetHomery)
}
