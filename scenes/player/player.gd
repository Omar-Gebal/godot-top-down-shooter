extends CharacterBody2D

signal laser
signal grenade

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
		can_laser = false
		laser.emit()
		$LaserTimer.start()
	#grenade
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		can_grenade = false
		grenade.emit()
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true # Replace with function body.


func _on_grenade_timer_timeout():
	can_grenade = true
