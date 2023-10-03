extends CharacterBody2D

var speed = 100

var player

func _ready():
	player = get_tree().get_current_scene().get_node("./Player")

func _physics_process(delta):
	#if player == null: get_tree().get_nodes_in_group("Player")[0]
	if player != null:
		speed = (randi() % 300) + 100
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
