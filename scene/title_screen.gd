extends Control

@onready var Cat_SFX: AudioStreamPlayer2D = $Cat_SFX

func _on_start_pressed() -> void:
	SceneTransition.change_scene("res://scene/proto.tscn", 2)
	pass # Replace with function body.

func _on_credit_pressed() -> void:
	SceneTransition.change_scene("res://scene/credit.tscn", 2)
	pass # Replace with function body.

func _on_option_pressed() -> void:
	SceneTransition.change_scene("res://scene/option.tscn", 2)
	pass # Replace with function body.
