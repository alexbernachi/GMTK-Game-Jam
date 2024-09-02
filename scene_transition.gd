extends CanvasLayer

@onready var AnimPlayer = $AnimationPlayer


func change_scene(target: String) -> void:
	AnimPlayer.play("Slide_Right")
	await AnimPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	AnimPlayer.play("Slide_Right_Out")
	pass
