extends Area2D

var rotation_speed : int = 3
var options = ['laser', 'grenade', 'health']
#make laser more likely to get
var laser_likelyhood : float = 0.7
var type : String = options[0] if randf() <= laser_likelyhood else options[randi_range(1, 2)]
var direction: Vector2 = Vector2.UP

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0,0.4,0.8)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.8,0.2,0.2)
	elif type == 'health':
		$Sprite2D.modulate = Color(0.1,0.6,0.2)
	
	var distance: int = randi_range(150, 250)
	var target_pos : Vector2 = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0, 0))
func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	print(body)
	if type == 'laser':
		Globals.laser_amount += 5
	elif type == 'grenade':
		Globals.grenade_amount += 1
	elif type == 'health':
		Globals.health += min(Globals.health + 10, 100)
		
	queue_free()
