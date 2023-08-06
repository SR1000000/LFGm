CheckVictory(ByRef RepeatStage) {
	global Victory, LevelUp, ImpProf, BDSafe, BDSafer

	if(RepeatStage!=1)
		return 0
	if(!PixelNot(Victory) || !PixelNot(LevelUp) || !PixelNot(ImpProf))
	{
		RepeatStage := 2
		RCtrlClick(BDSafe,BDSafer)
		RandSleep(100,300)
		return 1
	}
	return -1
}

CheckClickRetry(ByRef RepeatStage) {
	global RetryB, RetryBr, BDSafe, BDSafer

	if(RepeatStage!=2)
		return 0
	DoThisUntilThat("RCtrlClick","PixelIs",700,RetryB,,BDSafe,BDSafer)
	if(!PixelNot(RetryB))
	{
		DoThisUntilThat("RCtrlClick","PixelNot",300,RetryB,,RetryB,RetryBr)
		RepeatStage := 1
		return 1
	}

	return -1
}

CheckArenaContinue() {
	global ArenaContinueB, ArenaContinueBr
	if(!PixelNot(ArenaContinueB))
	{
		DoThisUntilThat("RCtrlClick","PixelNot",1300,ArenaContinueB,,ArenaContinueB,ArenaContinueBr)
		return 1
	}
	return 0
}