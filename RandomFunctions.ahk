

NormalRand(x,y,int=1) 
{ 	;x lower y upper int for integer return
	;NormalRand(0,10) ;random integer between 0 and 10
	;NormalRand(5,20,0) ;random float between 5 and 20
	Loop 12
	{
		 Random, var,0.0,1
		 Num+=var
	}
	norm := (int) ? Round((y+x)/2+((Num-6)*(y-x))/6) : (y+x)/2+((Num-6)*(y-x))/6
	Return norm < x ? x : norm > y ? y : norm
}

RandSleep(a,b) 
{
	Random, var, a, b
	Sleep %var%
}


RandCircle(ByRef pointx, ByRef pointy, radius)
{
	OutX := NormalRand(-1,1,0)
	Sign := NormalRand(-1,1,0)
	pointy := Round((sqrt(1 - OutX ** 2) * radius * Sign) + pointy)
	pointx := Round((OutX * radius) + pointx)
	;pointx := OutX
	;pointy := OutY
}

RandRect(ByRef pointx, ByRef pointy, xlength, ylength) 
{
	OutX := NormalRand(-1,1,0)
	Sign := NormalRand(-1,1,0)
	pointy := Round((OutX * ylength) + pointy)
	pointx := Round((Sign * xlength) + pointx)
	;pointx := OutX
	;pointy := OutY
}