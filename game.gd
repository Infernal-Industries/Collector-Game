extends Node2D

var screen_size = get_viewport_rect().size
var screen_width = screen_size[0]
var screen_height = screen_size[1]

var characters = []
var team1 = []
var team2 = []
var targets = []

var character_in_turn

func add_player_character(character, x_position, y_position, team):
	var new_character = Sprite2D.new()
	new_character.texture = load("res://character.jpeg")
	var script = load("res://" + character + ".gd")
	new_character.set_script(script)
	add_child(new_character)
	
	new_character.position.x = x_position
	new_character.position.y = y_position
	new_character.set_team(team)
	
	characters.append(new_character)
	if team == 1:
		team1.append(new_character)
	elif team == 2:
		team2.append(new_character)

func _ready():
	add_player_character("test_character", 300, 300, 1)
	add_player_character("test_character", 700, 700, 2)
	
	character_in_turn = team1[0]

func _process(delta):
	screen_size = get_viewport_rect().size
	screen_width = screen_size[0]
	screen_height = screen_size[1]
	$"Basic Attack Button".position.x = screen_width - $"Basic Attack Button".size.x - 100
	$"Basic Attack Button".position.y = screen_height - $"Basic Attack Button".size.y - 100

func _on_basic_attack_button_pressed():
	if character_in_turn.has_method("basic_attack"):
		targets.append(team2[0])
		print(targets[0].health)
		character_in_turn.basic_attack(targets[0].position.x, targets[0].position.y)
		targets[0].take_damage(character_in_turn.atk)
		print(targets[0].health)
		targets.clear()
