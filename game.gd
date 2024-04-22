extends Node2D

var characters = []

func add_player_character(health):
	var sprite = Sprite2D.new()
	sprite.texture = load("res://character.jpeg")
	var script = load("res://character.gd")
	sprite.set_script(script)
	add_child(sprite)
	
	sprite.set_health(health)
	
	characters.append(sprite)

func _ready():
	add_player_character(100)
	
	if characters[0].has_method("attack"):
		characters[0].attack(characters[0].position.x, characters[0].position.y - 50)
