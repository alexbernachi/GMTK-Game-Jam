extends Area2D

@onready var Munch_SFX: AudioStreamPlayer2D = $MunchSFX
@onready var CPU_Particles_2d: CPUParticles2D = $CPUParticles2D

var points: int = 1

func _ready() -> void:
	GameManager.connect("Food", Foodmanager)

func Foodmanager(Type):
	@warning_ignore("unused_variable")
	match Type:
		1: 
			CPU_Particles_2d.self_modulate = Color(0.824, 0.612, 0.541, 1.0)
		2:
			CPU_Particles_2d.self_modulate = Color(0.443, 0.157, 0.208, 1.0)
		3:
			CPU_Particles_2d.self_modulate = Color(0.651, 0.149, 0.329, 1.0)
		4:
			CPU_Particles_2d.self_modulate = Color(0.875, 0.259, 0.431, 1.0)
		_:
			push_error("Particle Color does not process")


func _on_body_entered(body: Node2D) -> void:
		body.queue_free()

func _on_area_entered(area):
	if area.name == "PointShape":
		GameManager.emit_signal("Points", points)
		Munch_SFX.pitch_scale = randf_range(0.80, 1.24)
		Munch_SFX.play()
		print(area)
		CPU_Particles_2d.emitting = true
		
	if area.name == "DeadShape":
		GameManager.emit_signal("Lose")
		return
	pass # Replace with function body.
