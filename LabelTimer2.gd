extends Label

var time = 0
onready var main = get_tree().current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	text = str(time)
#	pass


func _on_Timer_timeout():
	if main.player != null:
		time += 1
	pass # Replace with function body.
