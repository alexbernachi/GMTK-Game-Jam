extends CharacterBody2D

@onready var icon: Sprite2D = $Icon
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var stretch_audio = $StretchAudio
@onready var de_stretch_audio = $DeStretchAudio


@export var speed: float

#region for value of cat stretching
# Col_position mean the Y_axis collision position
# Spr_position mean the Y_axis of Cat head position
# Icon_Scale mean the the Scale of Y_axis of cat body to stretch

@export var Max_Col_position: float = -675.375
@export var Max_Spr_position: float = -1024.5
@export var Max_Icon_Scale: float = 6.34199

@export var Min_Col_position = -25.375
@export var Min_Spr_position = -374.5
@export var Min_Icon_Scale = 1.142

@export var Max_time_duration: float = 0.0
@export var Min_time_duration: float = 0.0

#endregion
var Game_Over: bool = false

func _ready() -> void:
	GameManager.connect("Lose", Update_Lose)
	pass

func _physics_process(_delta):
	if Game_Over:
		return
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	## When the player press press and release the button
	if Input.is_action_pressed("Increase"):
		if Input.is_action_just_pressed("Increase"):
			stretch_audio.playing = true
		de_stretch_audio.playing = false
		tween.tween_property(collision_shape_2d, "position:y", Max_Col_position, Max_time_duration).set_ease(Tween.EASE_IN)
		tween.tween_property(sprite_2d, "position:y", Max_Spr_position, Max_time_duration).set_ease(Tween.EASE_IN)
		tween.tween_property(icon, "scale:y", Max_Icon_Scale, Max_time_duration).set_ease(Tween.EASE_IN)
		
	else:
		if Input.is_action_just_released("Increase"):
			de_stretch_audio.playing = true
		stretch_audio.playing = false
		tween.tween_property(collision_shape_2d, "position:y", Min_Col_position, Min_time_duration).set_ease(Tween.EASE_OUT)
		tween.tween_property(sprite_2d, "position:y", Min_Spr_position, Min_time_duration).set_ease(Tween.EASE_OUT)
		tween.tween_property(icon, "scale:y", Min_Icon_Scale, Min_time_duration).set_ease(Tween.EASE_OUT)
	

func Update_Lose():
	Game_Over = true
	pass
