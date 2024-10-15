extends Control

@onready var MasterVol = $MarginContainer/VBoxContainer/SplitContainer/VolumeContainer/MasterSlider
@onready var MusicVol = $MarginContainer/VBoxContainer/SplitContainer/VolumeContainer/MusicSlider
@onready var SFXVol = $MarginContainer/VBoxContainer/SplitContainer/VolumeContainer/SFXSlider
@onready var Test_sound = $CatMeowTest

var MasterBus
var MusicBus
var SFXBus

func _ready():
	#Get the index number and assign it to it variable
	MasterBus= AudioServer.get_bus_index("Master")
	MusicBus = AudioServer.get_bus_index("Music")
	SFXBus = AudioServer.get_bus_index("SFX")
	
	#grab the value from DB to linear
	MasterVol.value = db_to_linear(AudioServer.get_bus_volume_db(MasterBus))
	MusicVol.value = db_to_linear(AudioServer.get_bus_volume_db(MusicBus))
	SFXVol.value = db_to_linear(AudioServer.get_bus_volume_db(SFXBus))
	


func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MasterBus, linear_to_db(value))
	pass # Replace with function body.

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MusicBus, linear_to_db(value))
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFXBus, linear_to_db(value))
	pass # Replace with function body.

func _on_return_pressed() -> void:
	SceneTransition.change_scene("res://scene/title_screen.tscn", 2)
	pass # Replace with function body.


func _on_test_sound_pressed() -> void:
	Test_sound.pitch_scale = randf_range(0.8, 1.2)
	Test_sound.play()
	pass # Replace with function body.
