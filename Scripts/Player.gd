extends KinematicBody2D

export (int) var speed = 450
export (int) var gravity = 100
export (bool) var jumpable = true
export (int) var jump_speed = -20


var velocity = Vector2.ZERO

var friction = 2
var acceleration = 1


func get_input():
	var dir = 0
	velocity.x = 0
	if Input.is_action_pressed("go_right"):
		velocity.x += speed
		dir += 1
	if Input.is_action_pressed("go_left"):
		velocity.x -= speed
		dir -= 1

	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	move_and_slide(velocity, Vector2(0, -1))
	#print_debug(velocity.y)
	if is_on_floor():
		velocity.y = 0
	if Input.is_action_pressed("jump") && jumpable == true:
		#if is_on_floor(): #this is disabled for testing purposes and i'm expecting to disable jumping permenantly
		velocity.y = jump_speed
		print_debug("jumped")

func _process(delta):
	if global_position.y > 720:
		get_tree().reload_current_scene()
		print_debug("restarted")
#make sure player always on the scene, use clamp func. it has 3 arguments
	var viewRect = get_viewport_rect()
	position.x = clamp(position.x,0,viewRect.size.x)
	#position.y = clamp(position.y,0,viewRect.size.y)
