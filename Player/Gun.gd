extends Node2D

@export var radius = 21

var mouse_pos

var player
var player_pos
var distance
var mouse_dir

func _ready():
	player = get_node(".")
	player_pos = player.global_transform.origin

func _process(delta):
	mouse_pos = get_global_mouse_position()
	player_pos = player.global_transform.origin
	distance = player_pos.distance_to(mouse_pos)
	mouse_dir = (mouse_pos-player_pos).normalized()
	if distance > radius:
		mouse_pos = player_pos + (mouse_dir * radius)
	self.global_transform.origin = mouse_pos

