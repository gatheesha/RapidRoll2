extends Node2D

var tilescene = preload("res://Scenes/Tile.tscn")

func _ready():
	$Timer.start() #this is optional lol

func _on_Timer_timeout():
	#rand no genenrator and getting screen size
	
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	
	#Getting a Random position
	var tile = tilescene.instance()
	rand.randomize()
	var x = rand.randf_range(0,screen_size.x)
	rand.randomize()
	var y = screen_size.y
	tile.position.y = y
	tile.position.x = x
	add_child(tile) #spawn a tile
