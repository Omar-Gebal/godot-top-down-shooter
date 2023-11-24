extends CharacterBody2D

const speed:int = 50
var direction:Vector2 = Vector2.RIGHT

func _process(_delta):
	velocity = direction * speed
	move_and_slide()

func hit():
	pass
