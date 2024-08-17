extends Node2D

@onready var Score_Label = $Label
@onready var spawner_timer = $SpawnerTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	Score_Label.text = "Score: 0"

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	pass


func _on_player_point(value):
	Score_Label.text = "Score: " + str(value)
	pass # Replace with function body.
