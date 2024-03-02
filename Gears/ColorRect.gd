extends ColorRect
var Drive1
var Drive2
var Drive3
var Drive4
var Drive5
var Drive6
var Drive7
var secondhand
var minutehand
var hourhand
var t
var ang1
var ang2
var ang3
var ang4
var ang5
var ang6
var ang7
var omega

# Called when the node enters the scene tree for the first time.
func _ready():
	Drive1 = get_node("Drive1")
	Drive2 = get_node("Drive2")
	Drive3 = get_node("Drive3")
	Drive4 = get_node("Drive4")
	Drive5 = get_node("Drive5")
	Drive6 = get_node("Drive6")
	Drive7 = get_node("Drive7")
	secondhand = get_node("Drive1/SecondHand")
	minutehand = get_node("Drive5/MinuteHand")
	hourhand = get_node("Drive7/HourHand")
	
	t = 0;
	ang1 = Drive1.rotation
	ang2 = Drive2.rotation
	ang3 = Drive3.rotation
	ang4 = Drive4.rotation
	ang5 = Drive5.rotation
	ang6 = Drive6.rotation
	ang7 = Drive7.rotation
	omega = PI/30
	
	var time = Time.get_time_dict_from_system()
	secondhand.rotation = time["second"]*PI/30 - PI/2 - ang1
	minutehand.rotation = time["minute"]*PI/30 - PI/2 - ang5
	hourhand.rotation =  time["hour"]*PI/6 + time["minute"]*PI/360 - PI/2 - ang7
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta;
	var ang = omega*floor(t);
	Drive1.rotation= ang + ang1;   # seconds
	Drive2.rotation = -ang/2 + ang2
	Drive3.rotation = ang/4 + ang3
	Drive4.rotation = -ang/12 + ang4
	Drive5.rotation = ang/60 + ang5 # minutes
	Drive6.rotation = -ang/180 + ang6
	Drive7.rotation = ang/720 + ang7
	pass
