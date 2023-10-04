extends Node


var restart



func restartgame():
	get_tree().reload_current_scene()
	
	

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	restart = Input.is_action_just_pressed("restart")
	if(restart):
		restartgame()
