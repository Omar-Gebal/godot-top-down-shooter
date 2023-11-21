extends Node2D

var speed: int = 500

func _process(delta):
	#movement
	var direction : Vector2 = Input.get_vector("left","right","up","down")
	position += direction * speed * delta
	#shooting
	if Input.is_action_just_pressed("primary action"):
		print("pew")
	#gernade
	if Input.is_action_just_pressed("secondary action"):
		print("kaboom")
