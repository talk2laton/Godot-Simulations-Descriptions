extends ColorRect
var Spring1
var Spring2
var Valve1
var Valve2
var Lever1
var Lever2
var Gear0
var Gear1
var Gear2
var Cam1
var Cam2
var Rod1
var Rod2
var Piston
var Connector
var Crank
var t
var s
var L1
var L2
var omega
var ang0
var ang1
var ang2
var s10
var s20
var r10
var r20
var v10
var v20
var d1
var d2
var camang1
var camang2
var CrankRadius
var ConnectorLength
var crankang

# Called when the node enters the scene tree for the first time.
func _ready():
	Spring1 = get_node("Block/Spring1")
	Spring2 = get_node("Block/Spring2")
	Valve1 = get_node("Block/Valve1")
	Valve2 = get_node("Block/Valve2")
	Lever1 = get_node("Block/Lever1")
	Lever2 = get_node("Block/Lever2")
	Gear0 = get_node("Block/Gear0")
	Gear1 = get_node("Block/Gear1")
	Gear2 = get_node("Block/Gear2")
	Cam1 = get_node("Block/Gear1/Cam1")
	Cam2 = get_node("Block/Gear2/Cam2")
	Rod1 = get_node("Block/ConnectingRod1")
	Rod2 = get_node("Block/ConnectingRod2")
	Piston = get_node("Block/Piston")
	Connector = get_node("Block/Connect")
	Crank = get_node("Block/Crank")
	
	t = 0; omega = -1;
	L1    = Spring1.position.y - Valve1.position.y
	L2    = Spring2.position.y - Valve2.position.y
	ang0  = Gear0.rotation
	ang1  = Gear1.rotation
	ang2  = Gear2.rotation
	camang1 = Cam1.rotation
	camang2 = Cam2.rotation
	s10 = Spring1.scale.y
	s20 = Spring2.scale.y
	r10 = Rod1.position.y
	r20 = Rod2.position.y
	v10 = Valve1.position.y
	v20 = Valve2.position.y
	crankang = Crank.rotation;
	CrankRadius = Connector.position.y;
	ConnectorLength = Connector.position.y - Piston.position.y
	
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t +=delta
	var ang = omega*t;
	Gear0.rotation  = ang + ang0;   # seconds
	Gear1.rotation  = _wrap(-ang/2 + ang1)
	Gear2.rotation  = _wrap(-ang/2 + ang2)
	d1 = 240*rodtop(Gear1.rotation + camang1)
	d2 = 240*rodtop(Gear2.rotation + camang2)
	Rod1.position.y = r10 - d1
	Rod2.position.y = r20 - d2
	Lever1.rotation = -atan(d1/(Rod1.position.x - Lever1.position.x))
	Lever2.rotation = -atan(d2/(Rod2.position.x - Lever2.position.x))
	Valve1.position.y = v10 + 0.9*d1;
	Valve2.position.y = v20 + 0.9*d2;
	Spring1.scale.y = spring_scale(Valve1.position.y, Spring1.position.y, L1, s10)
	Spring2.scale.y = spring_scale(Valve2.position.y, Spring2.position.y, L2, s20)
	Connector.position = CrankRadius*Vector2(cos(ang - crankang), sin(ang - crankang))
	Piston.position.y = -sqrt(ConnectorLength**2 - Connector.position.x**2)+Connector.position.y
	Connector.rotation = atan(Connector.position.x/(Piston.position.y-Connector.position.y))
	Crank.rotation = ang + crankang
	pass
	
func spring_scale(vy, sy, L, s0):
	return s0*(sy - vy)/L
	
func rodtop(ang):
	return 1.2*exp(-2*(ang - PI)**2)
	
func _wrap(ang):
	var a = abs(ang)
	var n = floor(a/(2*PI))
	return a - 2*PI*n

func _on_faster_pressed():
	omega *= 2.0
	pass # Replace with function body.

func _on_slower_pressed():
	omega /= 2.0
	pass # Replace with function body.
