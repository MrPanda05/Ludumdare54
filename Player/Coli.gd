extends Area2D


@export var speed = 200

@export var damageToEnemies = 1

var labes

var count

@export var Hit : AudioStreamPlayer2D
@export var Explosion : AudioStreamPlayer2D


func _ready():
	labes = get_tree().get_current_scene().get_node("./Ui/Label")
	count = 0

#Colision with enemies
func _on_area_entered(area):
	if area.name == "EnemyColi":
		area.lifePoints -= damageToEnemies
		if(area.lifePoints > 0):
			Hit.play()
		if(area.lifePoints <= 0):
			print("die")
			Explosion.play()
			count += 1
			labes.text = str(count)
			area.get_parent().queue_free()
