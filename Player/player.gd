extends CharacterBody2D

@export var speed = 300

@export var isDead : bool

@export var life = 3

var direction = Vector2.ZERO



func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")

	

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
