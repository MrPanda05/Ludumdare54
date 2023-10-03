extends Area2D

@export var Explosion : AudioStreamPlayer2D

func _on_body_entered(body):
	if(body.name == "Player"):
		Explosion.play()
		body.queue_free()
		await get_tree().create_timer(4.5).timeout
		get_tree().reload_current_scene()

