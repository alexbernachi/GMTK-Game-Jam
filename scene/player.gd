extends CharacterBody2D

signal Point(value)

var points: int = 1
var Totals: float = 0


func _physics_process(_delta):
	
	print(scale.y)
	
	if Input.is_action_pressed("Increase"):
			scale.y += 0.2
		
	if Input.is_action_pressed("Decrease") and scale.y > 1:
		scale.y -= 0.2
		if scale.y == 1:
			return
		Totals += points
		Point.emit(Totals)
		pass
