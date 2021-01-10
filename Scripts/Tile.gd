extends StaticBody2D

export (int) var scrollspeed = 100
var velocity = Vector2()

func _ready():
	pass
func _process(delta):
	if global_position.y < 10:
		queue_free()

func _physics_process(delta):
	position.y -= scrollspeed * delta
