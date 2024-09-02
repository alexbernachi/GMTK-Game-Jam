extends Area2D

@onready var Munch_SFX: AudioStreamPlayer2D = $MunchSFX

var points: int = 1

func _on_body_entered(body: Node2D) -> void:
		body.queue_free()



func _on_area_entered(area):
	if area.name == "PointShape":
		GameManager.emit_signal("Points", points)
		Munch_SFX.pitch_scale = randf_range(0.80, 1.24)
		Munch_SFX.play()
		area.queue_free()
	if area.name == "DeadShape":
		GameManager.emit_signal("Lose")
		return
	pass # Replace with function body.
