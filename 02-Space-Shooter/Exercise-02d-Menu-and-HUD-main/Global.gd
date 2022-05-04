extends Node

var VP = Vector2.ZERO

var score = 0
var time = 600
var lives = 5
var level = 1
var poweredF = false
var poweredS = false
var eCounter = 1
var aCounter = 1
var aCheck = get_node_or_null("/root/Game/Asteroid_Container/Asteroid")
var eCheck = get_node_or_null("/root/Game/Enemy_Container/Enemy")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _resize():
	VP = get_viewport().size

func reset():
	get_tree().paused = false
	score = 0
	lives = 5
	poweredF = false
	poweredS = false
	eCounter += level*randf()
	aCounter += level*randf()
	if aCheck == null && eCheck == null:
		pass

func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
	

func update_time(t):
	time += t
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_time()
	if time <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")

func update_lives(l):
	lives += l
	if lives <=0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_lives()

func update_level(a):
	if aCheck == null&&eCheck==null:
		level+=1
		reset()
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_level()
