extends Area2D

var rotation_speed : int = 3
var options = ['laser', 'grenade', 'health']
#make laser more likely to get
var laser_likelyhood : float = 0.7
var type : String = options[0] if randf() <= laser_likelyhood else options[randi_range(1, 2)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0,0.4,0.8)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.8,0.2,0.2)
	if type == 'health':
		$Sprite2D.modulate = Color(0.1,0.6,0.2)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
