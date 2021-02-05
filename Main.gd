extends Node2D

onready var player = $Player
onready var music = $AudioStreamPlayer2D
onready var gameover = $LabelGameOver
var feeds = 0;

func _ready():
	spawn()
	spawn()

func _process(delta):
	if gameover.percent_visible == 1:
		if Input.is_action_just_pressed("actionButton"):
			get_tree().reload_current_scene()

func addfeeds():
	feeds = 3;
	
func spawn():
	var _array = []
	var num = 0
	for i in get_children():
		if i.filename == "res://SpawnPoint.tscn":
			_array.insert(num, i)
			num += 1
	var chosen = _array[randi() % _array.size()]
	chosen.spawn()


func _on_SpawnTimer_timeout():
	if player != null:
		spawn()
