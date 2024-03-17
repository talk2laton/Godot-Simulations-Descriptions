extends Sprite2D
var fullscreen
# Called when the node enters the scene tree for the first time.
func _ready():
	fullscreen = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(fullscreen):
		scale.x = 1.5
		scale.y = 1.5
	else:
		scale.x = 1
		scale.y = 1	
	pass


func _on_full_screen_toggled(toggled_on):
	if(toggled_on):
		fullscreen = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		fullscreen = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)	
	pass # Replace with function body.
