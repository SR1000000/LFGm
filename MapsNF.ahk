
1_6()	;Each endround recenters map?
{
	local heli1 := [292, 331], node1 := [517, 328], node2 := [397, 511]
	, node3, node4, node5, node6, node7, node8, node9, refnode

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 36)	;Click heli1
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3300)

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

	node2 := [400, 331], node3 := [565, 520] ;node4 := [688, 334]

	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node2,21)
	RandSleep(300,450)
	RCtrlClick(node3,21)
	
	RandSleep(900,1100)
	ControlSend, , c, %CSTitle%
	LookForClickClose(0.7)

	node4 := StrSplit(WGImageSearch("Maps\1_6\HeliBlank",,5,,,,,1),",")
	node4 := [node4[1]+6, node4[2]+3]
	RCtrlClick(node4,21)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 3000

;
	MsgBox Need drag or not?
	Exit
	RandSleep(900,1100)
	ControlSend, , f, %CSTitle%
	LookForClickClose(0.7)

	node4 := [403, 331], node5 := [184, 322], node6 := [358, 139], node7 := [547, 226]
	ResupplyDps(node4,21)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node5,21)
	RandSleep(300,450)
	RCtrlClick(node6,21)
	RandSleep(300,450)
	RCtrlClick(node7,21)
	RandSleep(400,600)
	RCtrlClick(ExecuteB,ExecuteBrx,ExecuteBry)

	GuiControl,, StatA, Long Wait after Execute %ClickCount%
	Sleep 10000
	WGImageSearch("PlanButton",-120)

	RandSleep(400,600)
	RCtrlClick(EndRoundB,EndRoundBrx,EndRoundBry)
	DoThisUntilThat("MidBattleCheck","PixelIs",APTensDigit)
	Sleep 3000
;
	MsgBox node7 node9 might be incorrect
	node7 := [430, 331]
	node8 := [406, 532]
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)
	RandSleep(300,450)
	RCtrlClick(node7,21)
	RandSleep(300,450)
	RCtrlClick(node8,21)

	RandSleep(900,1100)
	ControlSend, , b, %CSTitle%
	LookForClickClose(0.7)
;
	MsgBox good reference node after drag b? keep eye on history
	refnode := StrSplit(WGImageSearch("Maps\1_6\Enemy2",,5,403,283,,,3),",")
	node9 := [refnode[1]-165, refnode[2]-180]
	RCtrlClick(node9,45)
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

	Sleep 200
	ClickUntilPixelColor(DepNightC,, heli2, 21) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep2,, EchDep2, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok

	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3500)
	
	ResupplyDPS(heli2, 21)
	ClickUntilPixelColor(PlanB,, PlanB, PlanBrx, PlanBry)

	RandSleep(900,1100)
	ControlSend, , g, %CSTitle%
	LookForClickClose(0.7)

	node1 := StrSplit(WGImageSearch("Maps\3_6\Enemy1",,10,390,379,639,,2),",")
	node1[1] += 6
	node1[2] += -27
	node2 := [node1[1]-234, node1[2]-57]
	RCtrlClick(node1,21)
	RandSleep(300,450)
	RCtrlClick(node2,21)
/*
	RandSleep(900,1100)
	ControlSend, , d, %CSTitle%
	LookForClickClose(0.7)

	node2 := StrSplit(WGImageSearch("Maps\3_6\Enemy1",,10,,,,,1),",")
	node2[1] += 3
	node2[2] += 18
	node3 := [node2[1]-78, node2[2]+174]
	RCtrlClick(node2,12)
	RandSleep(300,450)
	RCtrlClick(node3,12)
*/	

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
	RandSleep(3000,3500)
	
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
	RandSleep(3000,3500)
	
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

6_6()
{
	local heli1 := [514, 409], heli2, node1, node2, node2chk, node3, node4

	WaitForPixelClick(RedSangvis, ecc) ;Wait for active nodes screen (red sangvis icon)
	ClickUntilPixelColor(DepNightC,, heli1, 45) ;Click Helipad until deploy screen
	ClickUntilPixelColor(EchDep3,, EchDep3, EchNumrx, EchNumry)
	WaitForPixelClick(DepOk, ecc, DepOk, DepOkrx, DepOkry)	;Deploy Ok
	WaitForPixelClick(RedSangvis, ecc, StartOp, StartOprx, StartOpry)	;click start operations
	RandSleep(3000,3300)


}