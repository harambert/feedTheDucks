extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var moveSpd : int = 100
var vel = Vector2.ZERO
enum {
	NORMAL,
	BOW
}
var state = NORMAL

onready var animation = $AnimationPlayer
onready var main = get_tree().current_scene
onready var put = $AudioStreamPlayer2D
var Feeds = load("res://Feeds.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == NORMAL:
		if Input.is_action_pressed("moveRight"):
			vel.x = 1
		elif Input.is_action_pressed("moveLeft"):
			vel.x = -1
		else:
			vel.x = 0
		if Input.is_action_pressed("moveUp"):
			vel.y = -1
		elif Input.is_action_pressed("moveDown"):
			vel.y = 1
		else: vel.y = 0
		
		if vel != Vector2.ZERO:
			animation.play("walk")
		else:
			animation.stop()
		
		vel = vel.normalized()
		move_and_collide(vel * delta * moveSpd)
		
		if Input.is_action_just_pressed("actionButton"):
			if main.feeds > 0:
				putFeeds()
			
	if state == BOW:
		animation.play("bow")
		
func putFeeds():
	state = BOW
	var feeds = Feeds.instance()
	main.add_child(feeds)
	feeds.global_position = global_position + Vector2(0, 5)
	main.feeds -= 1
	put.play()
	
func returnToNormal():
	state = NORMAL
	animation.play("walk")
	
