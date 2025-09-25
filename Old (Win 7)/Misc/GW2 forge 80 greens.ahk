^!a::
ClickRandPos(780,790,675,685,1)
RandSleep(2000,2200)
ClickRandPos(210,230,290,310,2)
RandSleep(50,100)
ClickRandPos(270,290,290,310,2)
RandSleep(50,100)
ClickRandPos(330,350,290,310,2)
RandSleep(50,100)
ClickRandPos(390,410,290,310,2)
RandSleep(50,100)
return

^!s::
ClickRandPos(781,787,676,684,1)
return



RandSleep(x,y) {
;Generate a random number between x(100) and y(1000)
Random, rand, %x%, %y%
;Sleep for the random amount
Sleep %rand%
}

ClickRandPos(x1,x2,y1,y2,z) {
Random, rand1, %x1%, %x2%
Random, rand2, %y1%, %y2%
Click %rand1%,%rand2%,%z%
}