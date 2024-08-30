extends Control

@onready var MasterVol = $MarginContainer/VBoxContainer/VolumeContainer/MasterSlider
@onready var MusicVol = $MarginContainer/VBoxContainer/VolumeContainer/MusicSlider
@onready var SFXVol = $MarginContainer/VBoxContainer/VolumeContainer/SFXSlider

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
	
	#put the value from Db to linear to the slider
	MasterVol.value = db_to_linear(MasterBus)
	MusicVol.value = db_to_linear(MusicBus)
	SFXVol.value = db_to_linear(SFXBus)



func _on_master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MasterBus, linear_to_db(value))
	pass # Replace with function body.

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MusicBus, linear_to_db(value))
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFXBus, linear_to_db(value))
	pass # Replace with function body.
