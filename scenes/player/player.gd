extends CharacterBody2D

const speed: int = 500
var can_laser:bool = true
var can_grenade:bool = true


func _process(_delta):
	#movement
	var direction : Vector2 = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	#shooting
	if Input.is_action_just_pressed("primary action") and can_laser:
		print("pew")
		can_laser = false
		$LaserTimer.start()
	#grenade
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("kaboom")
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true # Replace with function body.


func _on_grenade_timer_timeout():
	can_grenade = true
