extends Node2D

var Scissors = preload("res://scene/scissor.tscn")
var Cucumber = preload("res://scene/cucumber.tscn")

@onready var game_over: Control = $"Control/Game Over"

@onready var Bowl: Area2D = $Bowl


@onready var Score_Label = $Control/Label
@onready var spawner_timer = $SpawnerTimer

var X_Pos: float
var X_side: int

var Totals: float = 0

#get the game ready
# Called when the node enters the scene tree for the first time.
func _ready():
	#Connect to signal
	GameManager.connect("Points", Update_Score)
	GameManager.connect("Lose", Show_Game_Over)
	X_side = 1
	Score_Label.text = "Score: 0"
	randomize()
	Engine.time_scale = 1
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#when spawn, it choose which side and spawn them
func _process(_delta):
	if spawner_timer.is_stopped():
		Side_Spawner()
		Spawner()
	
	
	
	pass

func Show_Game_Over():
	Engine.time_scale = 0
	game_over.visible = true
	pass

#Update the Score on screen
func Update_Score(new_value):
	Totals += new_value
	Score_Label.text = "Score: " + str(Totals)
	pass

#Spawn in some scissor
func Spawner():
	var Deadly_Rate = randi_range(1,4)
	var Instant = Scissors.instantiate()
	var Deadly_Instant = Cucumber.instantiate()
	if Deadly_Rate == 4:
		Deadly_Instant.position =  Vector2(X_Pos, randf_range(400, 500))
		add_child(Deadly_Instant)
		pass
	else:
		Instant.position =  Vector2(X_Pos, randf_range(400, 500))
		add_child(Instant)
	spawner_timer.start()
	pass
	
func Side_Spawner():
	#automatically flip screen
	X_side *= -1
	
	if X_side > 0:
		X_Pos = 0
	else:
		X_Pos = 1250
	pass
