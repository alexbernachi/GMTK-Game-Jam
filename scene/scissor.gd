extends CharacterBody2D

var dir: float
var Food_pick: int

@onready var cat_food_1: Sprite2D = $CatFood1
@onready var cat_food_2: Sprite2D = $CatFood2
@onready var cat_food_3: Sprite2D = $CatFood3
@onready var cat_food_4: Sprite2D = $CatFood4


const SPEED = 300.0
var Grab: bool = false

func _ready() -> void:
	randomize()
	Food_Randomizer()
	if position.x < 500:
		dir = 1
	if position.x > 500:
		dir = -1
	

func _physics_process(_delta):
	velocity.x = SPEED * dir

	if Grab:
		velocity.x = 0
	if dir == 1 and position.x > 1250:
		print("poof")
		queue_free()
		pass
	elif dir == -1 and position.x < 0:
		print("poof but other side")
		queue_free()
		 
	
	move_and_slide()
	

func Food_Randomizer():
	var Random_Spawner = randi_range(1, 4)
	if Random_Spawner == 1:
		cat_food_1.visible = true
	if Random_Spawner == 2:
		cat_food_2.visible = true
	if Random_Spawner == 3:
		cat_food_3.visible = true
	if Random_Spawner == 4:
		cat_food_4.visible = true
	
		
	

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	Grab = true
	#get_tree().call_deferred("change_scene_to_file", "res://scene/proto.tscn")
	pass # Replace with function body.


func _on_area_2d_body_exited(_body: Node2D) -> void:
	Grab = false
	pass # Replace with function body.
