extends KinematicBody2D

enum {
	MOVE,
	EAT
}

var vel = Vector2.ZERO
var direction = Vector2.ZERO
var dirVariation = Vector2.ZERO
var moveSpd = 15;

var state = MOVE
var target = null
onready var animation = $AnimationPlayer
onready var sprite = $Sprite
onready var locator = $FeedsLocator
onready var main = get_tree().current_scene
onready var soundDeath = $SoundDeath
onready var soundPeck = $SoundPeck

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var main = get_tree().current_scene
	var player = main.player
	
	if state == MOVE:
		moveSpd += 0.01
		animation.play("walk")
		if player != null and target == null:
			direction = (player.global_position - global_position).normalized()
			dirVariation = Vector2(rand_range(-0.2, 0.2), rand_range(-0.2, 0.2)) 
			vel = ((direction + dirVariation) * moveSpd)
			sprite.flip_h = direction.x < 0
			move_and_slide(vel)
		if target != null:
			direction = (target.global_position - global_position).normalized()
			dirVariation = Vector2(rand_range(-0.2, 0.2), rand_range(-0.2, 0.2)) 
			vel = ((direction + dirVariation) * moveSpd)
			sprite.flip_h = direction.x < 0
			move_and_slide(vel)
			
		if target == null:
			var _area = locator.get_overlapping_areas()
			for i in _area:
				if i.filename == "res://Feeds.tscn":
					target = i
	else:
		animation.play("eat")
#	pass

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		main.music.stop()
		main.gameover.percent_visible = 1
		soundDeath.play()
	
func returnToNormal():
	state = MOVE
	moveSpd = 15
