extends StaticBody2D

export (int) var scrollspeed = 100
var velocity = Vector2()
var plays_backwords = false

func _ready():
	$AnimationPlayer.set_autoplay("idle")
	
func _process(delta):
	if global_position.y < 10:
		queue_free()

func _physics_process(delta):
	position.y -= scrollspeed * delta

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("go_down")

func _on_Area2D_body_exited(body):
	$AnimationPlayer.play_backwards("go_down")
	plays_backwords = true
	
