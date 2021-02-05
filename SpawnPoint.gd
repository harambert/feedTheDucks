extends Node2D


var Duck = load("res://Duck.tscn")
onready var main = get_tree().current_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn():
	var duck = Duck.instance()
	main.add_child(duck)
	duck.global_position = global_position
