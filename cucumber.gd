extends CharacterBody2D

@onready var Lime = $Lime

var dir: float
var Food_pick: int

const SPEED = 300.0
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
	if dir == 1 and position.x > 1250:
		queue_free()
		pass
	elif dir == -1 and position.x < 0:
		queue_free()
		 
	
	Lime.rotation += dir * _delta
	
	move_and_slide()
	

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	Grab = true
	pass # Replace with function body.


func _on_area_2d_body_exited(_body: Node2D) -> void:
	Grab = false
	pass # Replace with function body.
