extends Area2D

@export var damageToPlayer = 1

@export var lifePoints = 1

@export var speed = 200

@export var player : CharacterBody2D

@export var Hit : AudioStreamPlayer2D
@export var Explosion : AudioStreamPlayer2D


func _ready():
	var num = (randi() % 10) + 1
	lifePoints = num

#Colision with player
func _on_body_entered(body):
	if(body.name == "Player"):
		body.life -= damageToPlayer
		if(body.life > 0):
			Hit.play()
		if(body.life <= 0):
			Explosion.play()
			body.queue_free()
			await get_tree().create_timer(4.5).timeout
			get_tree().reload_current_scene()
