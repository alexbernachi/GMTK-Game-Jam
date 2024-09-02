extends Node2D

var Scissors = preload("res://scene/scissor.tscn")
var Cucumber = preload("res://scene/cucumber.tscn")

@onready var game_over: Control = $"Control/Game Over"

@onready var Bowl: Area2D = $Bowl


@onready var Score_Label = $Control/Label
@onready var Spawner_Timer = $SpawnerTimer
@onready var Animation_Player = $AnimationPlayer


var TimerSec:float
var Rate_Set: int

var X_Pos: float
var X_side: int

var Totals: int = 0
var SpawnerRateGoalTotal = 15

#get the game ready
# Called when the node enters the scene tree for the first time.
func _ready():
	Animation_Player.play("RESET")
	#Connect to signal
	GameManager.connect("Points", Update_Score)
	GameManager.connect("Lose", Show_Game_Over)
	
	TimerSec = Spawner_Timer.wait_time
	Rate_Set = 0
	Spawn_Rate_Manager(Rate_Set)
	
	Engine.time_scale = 1
	X_side = 1
	Score_Label.text = "Score: 0"
	randomize()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#when spawn, it choose which side and spawn them
func _process(_delta):
	if TimerSec >= 0.5:
		if Totals >= SpawnerRateGoalTotal:
			SpawnerRateGoalTotal += 5
			Rate_Set += 1
			Spawn_Rate_Manager(Rate_Set)
			print("increase speed")
			return
	
	
	if Spawner_Timer.is_stopped():
		Side_Spawner()
		Spawner()
	
	pass

func Show_Game_Over():
	game_over.visible = true
	Animation_Player.play("Popup")
	await Animation_Player.animation_finished
	Engine.time_scale = 0
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
	# if the Rate is true, then it spawn a cucumber, else than spawn a food
	if Deadly_Rate == 4:
		Deadly_Instant.position =  Vector2(X_Pos, randf_range(400, 500))
		add_child(Deadly_Instant)
		pass
	else:
		Instant.position =  Vector2(X_Pos, randf_range(400, 500))
		add_child(Instant)
	#Spawner_Timer.start(TimerSec)
	Spawner_Timer.start(randf_range(TimerSec, TimerSec+0.5))
	pass
	
func Side_Spawner():
	#automatically flip screen
	X_side = randi_range(0, 1)
	
	if X_side == 0:
		X_Pos = 0
	else:
		X_Pos = 1250
		
	
		
	pass
	

#Increase the rate of food when reach the total
func Spawn_Rate_Manager(_rate: float):
	_rate = (_rate * 5)/1000
	TimerSec = TimerSec + -(_rate)
	print("Increase Speed:", TimerSec)
	pass
