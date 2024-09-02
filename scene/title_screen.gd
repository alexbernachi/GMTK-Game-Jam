extends Control

@onready var Cat_SFX: AudioStreamPlayer2D = $Cat_SFX

func _on_start_pressed() -> void:
	Cat_SFX.play()
	await Cat_SFX.finished
	SceneTransition.change_scene("res://scene/proto.tscn")
	pass # Replace with function body.

func _on_credit_pressed() -> void:
	SceneTransition.change_scene("res://scene/credit.tscn")
	pass # Replace with function body.

func _on_option_pressed() -> void:
	SceneTransition.change_scene("res://scene/option.tscn")
	pass # Replace with function body.
