extends Control

@onready var Meow_SFX: AudioStreamPlayer2D = $MeowSFX
@onready var Sad_Meow: AudioStreamPlayer2D = $Sad_Meow



func _on_meow_pressed() -> void:
	Meow_SFX.play()
	await Meow_SFX.finished
	get_tree().change_scene_to_file("res://scene/proto.tscn")
	pass # Replace with function body.


func _on_home_pressed() -> void:
	Engine.time_scale = 1
	SceneTransition.change_scene("res://scene/title_screen.tscn", 1)
	pass # Replace with function body.
