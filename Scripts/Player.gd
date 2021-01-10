extends KinematicBody2D

export (int) var speed = 200
export (int) var gravity = 400
export (bool) var jumpable = true
export (int) var jump_speed = -180

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("go_right"):
		velocity.x += speed
	if Input.is_action_pressed("go_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	if !is_on_floor():
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP,false, 4, PI/4, false)
	
	if Input.is_action_just_pressed("jump") && jumpable == true:
		#if is_on_floor(): #this is disabled for testing purposes and i'm expecting to disable jumping permenantly
		velocity.y = jump_speed

func _process(delta):
	if global_position.y > 720:
		get_tree().reload_current_scene()
		print_debug("restarted")
