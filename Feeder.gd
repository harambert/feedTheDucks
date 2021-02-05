extends Area2D

var entered = false
onready var main = get_tree().current_scene
onready var get = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("actionButton") and main.player.state == 0 and main.feeds < 3:
			main.addfeeds()
			main.player.state = 1
			get.play()
#	pass

func _on_Feeder_body_entered(body):
	if body.name == "Player":
		entered = true

func _on_Feeder_body_exited(body):
	if body.name == "Player":
		entered = false
