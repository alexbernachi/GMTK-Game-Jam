extends CharacterBody2D



func _physics_process(_delta):
	
	
	if Input.is_action_pressed("Increase"):
			scale.y += 0.2
		
	if Input.is_action_pressed("Decrease") and scale.y > 1:
		scale.y -= 0.2
		if scale.y == 1:
			return
		pass
