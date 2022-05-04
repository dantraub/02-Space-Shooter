extends Node2D

onready var Enemy = load("res://Enemy/Enemy.tscn")

func _ready():
	var enemy = Enemy.instance()
	enemy.position = Vector2(Global.VP.x*randf(),Global.VP.y*randf())
	add_child(enemy)

func _physics_process(_delta):
	if get_child_count() == 0:
		Global.update_level(1)
