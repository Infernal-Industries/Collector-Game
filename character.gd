extends Sprite2D

var team
var health
var atk

func _ready():
	position = get_viewport().size / 2

func basic_attack(x,y):
	var original_position = position
	var target_position = Vector2(x, y)
	
	var tween = create_tween()
	
	tween.tween_property(self, "position", target_position, 0.5).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "position", original_position, 0.5).set_trans(Tween.TRANS_LINEAR).set_delay(1)

func set_health(new_health):
	health = new_health

func set_team(new_team):
	team = new_team

func set_atk(new_atk):
	atk = new_atk

func take_damage(damage):
	health -= damage
