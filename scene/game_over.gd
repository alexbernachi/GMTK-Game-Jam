extends Control

@onready var Meow_SFX: AudioStreamPlayer2D = $MeowSFX
@onready var Sad_Meow: AudioStreamPlayer2D = $Sad_Meow



func _on_meow_pressed() -> void:
	Meow_SFX.play()
	await Meow_SFX.finished
	get_tree().change_scene_to_file("res://scene/proto.tscn")
	pass # Replace with function body.


func _on_home_pressed() -> void:
	Sad_Meow.play()
	await Sad_Meow.finished
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scene/title_screen.tscn")
	pass # Replace with function body.
