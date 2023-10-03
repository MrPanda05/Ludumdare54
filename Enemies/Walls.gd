extends Node2D

@export var top : CharacterBody2D 
@export var down : CharacterBody2D  
@export var left : CharacterBody2D  
@export var right : CharacterBody2D

var time

var topOgPos
var downOgPos
var leftOgPos
var rightOgPos

var randNum

var isReturning = false

@export var speed = 100

func getNum():
	var pen = randi() % 4
	return pen

func _ready():
	randomize()
	time = get_tree().get_current_scene().get_node("./timer")
	time.start(5)
	topOgPos = top.get_position()
	downOgPos = down.get_position()
	leftOgPos = left.get_position()
	rightOgPos = right.get_position()
	print(rightOgPos)

func _on_timer_timeout():
	randNum = getNum()
	print(randNum)
	#await get_tree().create_timer(4.5).timeout



func moveTo(dir, wall, isXConst, targetPos):
	wall.velocity = dir * speed
	wall.move_and_slide()
	var currentPos = round(wall.get_position())
	var NexPosX = round(Vector2(wall.get_position().x, targetPos))
	var NexPosY = round(Vector2(targetPos, wall.get_position().y))
	if isXConst:
		if(currentPos == NexPosX):
			isReturning = true
	else:
		if(currentPos == NexPosY):
			isReturning = true

func moveBack(dir, wall, ogPos):
	wall.velocity = dir * speed
	wall.move_and_slide()
	var currentPos = round(wall.get_position())
	if(currentPos == round(ogPos)):
		isReturning = false
		randNum = -1
		time.start(5)

func _physics_process(delta):
	if randNum == null: return
	#print(randNum)
	if((randNum == 0) && !isReturning):
		moveTo(Vector2.DOWN, top, true, 300)
	elif((randNum == 0) && isReturning):
		moveBack(Vector2.UP, top, topOgPos)
	if((randNum == 1) && !isReturning):
		moveTo(Vector2.UP, down, true, 340)
	elif((randNum == 1) && isReturning):
		moveBack(Vector2.DOWN, down, downOgPos)
	if((randNum == 2) && !isReturning):
		moveTo(Vector2.RIGHT, left, false, 400)
	elif((randNum == 2) && isReturning):
		moveBack(Vector2.LEFT, left, leftOgPos)
	if((randNum == 3) && !isReturning):
		moveTo(Vector2.LEFT, right, false, 400)
	elif((randNum == 3) && isReturning):
		moveBack(Vector2.RIGHT, right, rightOgPos)



