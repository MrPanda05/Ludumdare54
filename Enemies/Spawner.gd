extends Node2D

var enemy = preload("res://Enemies/Enemy.tscn")

var timer

var node


func _ready():
	timer = get_tree().get_current_scene().get_node("./EnemyTimer")
	node = get_tree().get_current_scene().get_node(".")
	timer.start(1.2)


func _on_enemy_timer_timeout():
	var spawnEnemy = enemy.instantiate()
	spawnEnemy.speed += (randi() % 300)
	node.add_child(spawnEnemy)
	var rand = (randi() % 4)
	if rand == 0:
		spawnEnemy.set_position(Vector2(0,0))
	elif rand == 1:
		spawnEnemy.set_position(Vector2(800,-300))
	elif  rand == 2:
		spawnEnemy.set_position(Vector2(200, 1000))
	elif  rand == 3:
		spawnEnemy.set_position(Vector2(-30, 100))
	print("gaybowser")
	
	
