extends Node2D

var Scissors = preload("res://scene/scissor.tscn")

@onready var Score_Label = $Label
@onready var spawner_timer = $SpawnerTimer

var Y_rand: float

# Called when the node enters the scene tree for the first time.
func _ready():
	Score_Label.text = "Score: 0"
	randomize()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if spawner_timer.is_stopped():
		Spawner()
	pass


func _on_player_point(value):
	Score_Label.text = "Score: " + str(value)
	pass # Replace with function body.


func Spawner():
	var Instant = Scissors.instantiate()
	
	Instant.position =  Vector2(0, randf_range(300, 600))
	add_child(Instant)
	spawner_timer.start()
	pass
	
