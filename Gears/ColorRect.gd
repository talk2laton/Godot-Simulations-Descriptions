extends ColorRect
var Drive
var Drive2
var Drive3
var Drive4
var t
var ang2
var ang3
var ang4
var omega

# Called when the node enters the scene tree for the first time.
func _ready():
	Drive = get_node("Drive")
	Drive2 = get_node("Drive2")
	Drive3 = get_node("Drive3")
	Drive4 = get_node("Drive4")
	t = 0;
	ang2 = Drive2.rotation
	ang3 = Drive3.rotation
	ang4 = Drive4.rotation
	omega = PI
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta;
	var ang = omega*t;
	Drive.rotation=ang;
	Drive2.rotation = -ang/3 + ang2
	Drive3.rotation = ang/12 + ang3
	Drive4.rotation = -ang/60 + ang4
	pass
