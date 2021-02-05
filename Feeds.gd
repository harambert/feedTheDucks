extends Node2D

const choose = [true, false]
onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var flip = choose[randi() % choose.size()]
	sprite.flip_h = flip 

func _on_Feeds_body_entered(body):
	if body.filename == "res://Duck.tscn":
		body.state = 1
		body.soundPeck.play()
		queue_free()
