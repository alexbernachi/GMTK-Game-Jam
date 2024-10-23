extends CharacterBody2D


@onready var Lime = $Lime

var dir: float
var Food_pick: int

var offscreen_offset: float = 100.0
var SPEED: float = 300.0
var Grab: bool = false

func _ready() -> void:
	if position.x < 500:
		dir = 1
	if position.x > 500:
		dir = -1
	
	

func _physics_process(_delta):
	velocity.x = SPEED * dir

	if Grab:
		velocity.x = 0
	Lime.rotation += dir * _delta
	
	Offscreen_detection()
	move_and_slide()

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
