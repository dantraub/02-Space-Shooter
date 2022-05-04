extends Node2D

onready var HealthPU = load("res://Powerups/HealthPowerUp.tscn")
onready var ShotPU = load("res://Powerups/ShotPowerUp.tscn")
# onready var SpeedPU = load("res://Powerups/SpeedPowerUp.tcsn")

var counter = 0
func _ready():
	sumP()
func _physics_process(_delta):
	pass
#use randf (random float) < or > 0-1
#move 11-13 into a function then call in ready
func sumP():
	if randf()<0.34:
		var healthPU = HealthPU.instance()
		healthPU.position = Vector2(Global.VP.x*randf(),Global.VP.y*randf())
		add_child(healthPU)
	if randf()<0.67&&randf()>0.33:
		var shotPU = ShotPU.instance()
		shotPU.position = Vector2(Global.VP.x*randf(),Global.VP.y*randf())
		add_child(shotPU)
	
