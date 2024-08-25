extends Area2D

@onready var Munch_SFX: AudioStreamPlayer2D = $MunchSFX

var points: int = 1

var Hit_Cucumber: bool = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cucumber":
		GameManager.emit_signal("Lose")
		Hit_Cucumber = true
		return
	else: 
		GameManager.emit_signal("Points", points)
		Munch_SFX.pitch_scale = randf_range(0.80, 1.24)
		Munch_SFX.play()
		body.queue_free()
