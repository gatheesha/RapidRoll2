extends StaticBody2D

export (int) var scrollspeed = 10
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	position.y -= scrollspeed * delta
