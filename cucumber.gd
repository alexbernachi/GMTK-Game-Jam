extends CharacterBody2D

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
		print("poof")
		queue_free()
		pass
	elif dir == -1 and position.x < 0:
		print("poof but other side")
		queue_free()
		 
	
	move_and_slide()
	

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	Grab = true
	#get_tree().call_deferred("change_scene_to_file", "res://scene/proto.tscn")
	pass # Replace with function body.


func _on_area_2d_body_exited(_body: Node2D) -> void:
	Grab = false
	pass # Replace with function body.
