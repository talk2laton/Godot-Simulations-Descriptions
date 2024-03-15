extends ColorRect
var Drive1
var Drive2
var Drive3
var t
var ang1
var ang2
var ang3
var omega
var tic
var pause


# Called when the node enters the scene tree for the first time.
func _ready():
	Drive1 = get_node("Gear1")
	Drive2 = get_node("Gear2")
	Drive3 = get_node("Gear3")
	
	t = 0;
	ang1  = Drive1.rotation
	ang2  = Drive2.rotation
	ang3  = Drive3.rotation
	
	
	omega = PI/30

	tic =  true
	pause = false
	# setting the current time
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not pause:
		t += delta;
		var ang = omega*floor(t);
		Drive1.rotation  = ang + ang1;   # seconds
		Drive2.rotation  = -ang + ang2
		Drive3.rotation  = ang + ang3
	pass


func _on_faster_pressed():
	omega *= 2
	pass # Replace with function body.


func _on_slower_pressed():
	omega /= 2
	pass # Replace with function body.
	
func _on_pause_pressed():
	pause = not pause
	pass # Replace with function body.

