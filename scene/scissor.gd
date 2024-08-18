extends CharacterBody2D

const SPEED = 300.0
var Grab: bool = false

func _physics_process(_delta):
	if position.x < 1000 :
		velocity.x = SPEED
	if Grab:
		velocity.x = 0
	
	move_and_slide()
	
@warning_ignore("unused_parameter")
func _on_body_entered(body):
	Grab = true
	#get_tree().call_deferred("change_scene_to_file", "res://scene/proto.tscn")
	print("grab")
	pass # Replace with function body.
