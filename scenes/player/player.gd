extends CharacterBody2D

var speed: int = 500

func _process(_delta):
	#movement
	var direction : Vector2 = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	#shooting
	if Input.is_action_just_pressed("primary action"):
		print("pew")
	#gernade
	if Input.is_action_just_pressed("secondary action"):
		print("kaboom")
