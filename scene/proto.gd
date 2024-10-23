extends Node2D

var Scissors = preload("res://scene/scissor.tscn")
var Cucumber = preload("res://scene/cucumber.tscn")

@onready var game_over: Control = $"Control/Game Over"

@onready var Bowl: Area2D = $Bowl

@onready var Score_Label = $Control/Label
@onready var Spawner_Timer = $SpawnerTimer
@onready var Animation_Player = $AnimationPlayer
@onready var color_rect = $Control/ColorRect

@export_range(0, 100) var Lime_chance: float

@export_subgroup("Leveling Sytem")
@export var TimerSec:float
@export var Level: int = 0
@export var Exp_1: float = 1.3
@export var Exp_2: float = 0.2
var Base_Requirement: float = 3
var Goal_Total: int = 2
var InitalTimer: float
var SuperLevel: int

var X_Pos_offset: float = 100
var X_Pos: float
var X_side: int

var Totals: int = 0

#get the game ready
# Called when the node enters the scene tree for the first time.
func _ready():
	Animation_Player.play("RESET")
	#Connect to signal
	GameManager.connect("Points", Update_Score)
	GameManager.connect("Lose", Show_Game_Over)
	
	SuperLevel = 1
	
	#TimerSec = Spawner_Timer.wait_time
	Level = 1
	Spawn_Rate_Manager(Level)
	
	Engine.time_scale = 1
	X_side = 1
	Score_Label.text = "Munch: 0"
	randomize()
	
	InitalTimer = TimerSec
	
	print("Goal Total: ",Goal_Total, "\n Level: ", Level)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#when spawn, it choose which side and spawn them
func _process(_delta):
	if !Spawner_Timer.is_stopped():
		if Goal_Total <= Totals:
			Spawn_Rate_Manager(Level)
			
			return
	
	#If the timer is done, it choose a side first then spawn, which later wait until timer done
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
	Score_Label.text = "Munch: " + str(Totals)
	pass

#Spawn in some scissor or Cucumber
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
		## Spawn fron outside of the off the screen, and spawn from top to bottom random
		Instant.position =  Vector2(X_Pos, randf_range(400, 500))
		add_child(Instant)
	
	
	
	#Spawner_Timer.start(TimerSec)
	## Start a timer with the range from the TimerSec
	Spawner_Timer.start(randf_range(TimerSec, TimerSec+0.5))
	pass
	
func Side_Spawner():
	var screensize = get_viewport().get_visible_rect().size
	#automatically flip screen
	X_side = randi_range(0, 1)
	
	match X_side:
		## Choose the left side of the screen
		0:
			X_Pos = (screensize.x - screensize.x) - X_Pos_offset
			pass
		## Choose the right side of the screen
		1:
			X_Pos = screensize.x + X_Pos_offset
			pass
		_:
			push_warning("There no side to spawn")

##TODO: Increase speed of Food
##
##TODO increase the chance of lime
func SpeedandLimeManager(_Level: int):
	#var InitialSuperLevel: int
	if _Level % 20 == 0:
		SuperLevel += 1
		
		
		
		pass
	pass


## Increase the spawn rate of food when reach the total
func Spawn_Rate_Manager(_rate: float):
	const TimerDeduct: float = 0.055
	if _rate >= 20:
		_rate = 20
		return
	
	if Goal_Total <= Totals:
		Level += 1
		
		Goal_Total = roundi((Base_Requirement * (_rate ** Exp_1)) + (_rate** Exp_2))
		TimerSec = InitalTimer - (Level * TimerDeduct)
		print(" ------------------- \n", "Goal Total: ",Goal_Total, "\n Level: ", Level, "\n  Spawnrate: ", TimerSec)
	
