extends CanvasLayer

var Catmeow = preload("res://Asset/Sound/cat-meow.mp3")
var CatMeow2 = preload("res://Asset/Sound/cat-call-meow 2.mp3")

@onready var AnimPlayer = $AnimationPlayer
@onready var AudioPlayer: AudioStreamPlayer = $AudioStreamPlayer


func change_scene(target: String, Music: int) -> void:
	Transition_music(Music)
	AnimPlayer.play("Slide_Right")
	await AnimPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	AnimPlayer.play("Slide_Right_Out")
	pass

func Transition_music(Target: int):
	match Target:
		1:
			AudioPlayer.stream = Catmeow
			AudioPlayer.pitch_scale = 0.8
		2:
			AudioPlayer.stream = CatMeow2
			AudioPlayer.pitch_scale = 1.01
		_:
			push_error("Can't Find Audio from this list")
