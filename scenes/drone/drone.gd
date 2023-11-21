extends CharacterBody2D

const speed:int = 500
var direction:Vector2 = Vector2.RIGHT

func _ready():
	pass
	
func _process(_delta):
	velocity = direction * speed
	move_and_slide()
