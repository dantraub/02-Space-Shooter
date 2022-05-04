extends Node2D

onready var Asteroid = load("res://Asteroid/Asteroid.tscn")

var counter = 0
func _ready():
	var asteroid = Asteroid.instance()
	asteroid.position = Vector2(Global.VP.x*randf(),Global.VP.y*randf())
	add_child(asteroid)
func _physics_process(_delta):
	if get_child_count() == 0:
		Global.update_level(1)
		#Global.update_level(1) and move 10-12 to elsewhere
