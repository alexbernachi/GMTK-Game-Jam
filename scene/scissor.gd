extends CharacterBody2D

var dir: float
var Food_pick: int
var Grab: bool = false
var offscreen_offset:= 100.0

@onready var cat_food_1: Sprite2D = $CatFood1
@onready var cat_food_2: Sprite2D = $CatFood2
@onready var cat_food_3: Sprite2D = $CatFood3
@onready var cat_food_4: Sprite2D = $CatFood4

@export var SPEED: float = 300.0

func _ready() -> void:	
	randomize()
	Food_pick= Food_Randomizer()
	## Move right
	if position.x < 500:
		dir = 1
	## Move Left
	if position.x > 500:
		dir = -1

func _physics_process(_delta):
	velocity.x = SPEED * dir
	if Grab:
		velocity.x = 0
	
	Offscreen_detection()
	
	FoodRotation(Food_pick, _delta)
	
	move_and_slide()
	

func Food_Randomizer():
	var Random_Spawner = randi_range(1, 4)
	
	match Random_Spawner:
		1:
			cat_food_1.visible = true
		2:
			cat_food_2.visible = true
		3:
			cat_food_3.visible = true
		4:
			cat_food_4.visible = true
	
	return Random_Spawner

func FoodRotation(target: int, delta: float):
	if !Grab:
		match target:
			1:
				cat_food_1.rotation += dir * delta
			2:
				cat_food_2.rotation += dir * delta
			3:
				cat_food_3.rotation += dir * delta
			4:
				cat_food_4.rotation += dir * delta


func Offscreen_detection():
	var screensize = get_viewport().get_visible_rect().size
	if dir == 1 and position.x > (screensize.x + offscreen_offset): ##delete on right screen
		queue_free()
	elif dir == -1 and position.x < ((screensize.x - screensize.x) - offscreen_offset):
		queue_free()

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	Grab = true
	pass # Replace with function body.

func _on_area_2d_body_exited(_body: Node2D) -> void:
	Grab = false
	pass # Replace with function body.

func _on_point_shape_area_entered(area: Area2D) -> void:
	if area.name == "Bowl":
		GameManager.Food.emit(Food_pick)
		queue_free()
	pass # Replace with function body.
