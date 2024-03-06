extends ColorRect
var Drive1
var Drive2
var Drive3
var Drive4
var Drive5
var Drive6
var Drive7
var Drive8
var Drive9
var Drive10
var Drive11
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
var ang8
var ang9
var ang10
var ang11
var omega
var tic


# Called when the node enters the scene tree for the first time.
func _ready():
	Drive1 = get_node("Scale/Gear1")
	Drive2 = get_node("Scale/Gear2")
	Drive3 = get_node("Scale/Gear3")
	Drive4 = get_node("Scale/Gear4")
	Drive5 = get_node("Scale/Gear5")
	Drive6 = get_node("Scale/Gear6")
	Drive7 = get_node("Scale/Gear7")
	Drive8 = get_node("Scale/Gear8")
	Drive9 = get_node("Scale/Gear9")
	Drive10 = get_node("Scale/Gear10")
	Drive11 = get_node("Scale/Gear11")
	secondhand = get_node("Scale/Gear1/SecondHand")
	minutehand = get_node("Scale/Gear7/MinuteHand")
	hourhand = get_node("Scale/Gear11/HourHand")
	
	t = 0;
	ang1  = Drive1.rotation
	ang2  = Drive2.rotation
	ang3  = Drive3.rotation
	ang4  = Drive4.rotation
	ang5  = Drive5.rotation
	ang6  = Drive6.rotation
	ang7  = Drive7.rotation
	ang8  = Drive8.rotation
	ang9  = Drive9.rotation
	ang10 = Drive10.rotation
	ang11 = Drive11.rotation
	
	omega = PI/30

	tic =  true
	# setting the current time
	var time = Time.get_time_dict_from_system()
	secondhand.rotation = time["second"]*PI/30 - PI/2 - ang1
	minutehand.rotation = time["minute"]*PI/30 + time["second"]*PI/1800 - PI/2 - ang7
	hourhand.rotation =  time["hour"]*PI/6 + time["minute"]*PI/360 - PI/2 - ang11
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta;
	var ang = omega*t;
	if(tic): ang = omega*floor(t)
	Drive1.rotation  = ang + ang1;   # seconds
	Drive2.rotation  = -ang/2 + ang2
	Drive3.rotation  = ang/4 + ang3
	Drive4.rotation  = -ang/12 + ang4
	Drive5.rotation  = ang/30 + ang5 
	Drive6.rotation  = -ang/30 + ang6
	Drive7.rotation  = ang/60 + ang7 # minutes
	Drive8.rotation  = -ang/60 + ang8 
	Drive9.rotation  = ang/120 + ang9 
	Drive10.rotation = -ang/240 + ang10 
	Drive11.rotation = ang/720 + ang11 # hours
	pass


func _on_faster_pressed():
	omega *= 10
	pass # Replace with function body.


func _on_slower_pressed():
	omega /= 10
	pass # Replace with function body.


func _on_check_button_toggled(toggled_on):
	tic = not tic
	pass # Replace with function body.
