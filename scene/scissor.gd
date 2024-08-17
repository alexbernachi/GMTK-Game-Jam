extends Area2D

class_name Enemy

const SPEED = 300.0

func _physics_process(_delta):
	if position.x < 1000:
		position.x += SPEED * _delta
	#elif position.x > 500:
		#velocity.x = -SPEED
	
@warning_ignore("unused_parameter")
func _on_body_entered(body):
	get_tree().call_deferred("change_scene_to_file", "res://scene/proto.tscn")
	print("Dead")
	pass # Replace with function body.
