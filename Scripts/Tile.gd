extends KinematicBody2D

export (int) var scroll_speed = 100
var velocity = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	velocity.y -= scroll_speed
	velocity = move_and_slide(velocity, Vector2.UP)
	#,false, 4, PI/4, false) << leave these here lol
