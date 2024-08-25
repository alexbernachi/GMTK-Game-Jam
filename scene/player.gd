extends CharacterBody2D

@onready var icon: Sprite2D = $Icon
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed: float

@export var Max_Col_position: float = -675.375
@export var Max_Spr_position: float = -1024.5
@export var Max_Icon_Scale: float = 6.34199

var Game_Over: bool = false

func _ready() -> void:
	GameManager.connect("Lose", Update_Lose)
	pass

func _physics_process(_delta):
	if Game_Over:
		return
	
	if Input.is_action_pressed("Increase"):
		sprite_2d.position.y -= speed
		icon.scale.y += 0.2
		collision_shape_2d.position.y -= speed

	if Input.is_action_pressed("Decrease") and icon.scale.y > 1:
		#scale.y -= 0.2
		sprite_2d.position.y += speed
		icon.scale.y -= 0.2
		collision_shape_2d.position.y += speed
		if icon.scale.y < 1:
			icon.scale.y = 1
	
	if sprite_2d.position.y < Max_Spr_position:
		sprite_2d.position.y = Max_Spr_position
		collision_shape_2d.position.y = Max_Col_position
		icon.scale.y = Max_Icon_Scale
		pass

func Update_Lose():
	Game_Over = true
	pass
