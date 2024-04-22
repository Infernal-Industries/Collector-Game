extends Sprite2D

var health

func _ready():
	position = get_viewport().size / 2

func attack(x,y):
	var original_position = position
	var target_position = Vector2(x, y)
	
	var tween = create_tween()
	
	tween.tween_property(self, "position", target_position, 1).set_trans(Tween.TRANS_LINEAR)
	
	tween.tween_property(self, "position", original_position, 1).set_trans(Tween.TRANS_LINEAR).set_delay(1)
	health -= 1
	print(health)

func set_health(new_health):
	health = new_health
