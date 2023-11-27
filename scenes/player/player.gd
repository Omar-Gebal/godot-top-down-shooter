extends CharacterBody2D

signal laser(pos : Vector2, direction: Vector2)
signal grenade(pos : Vector2, direction: Vector2)
signal update_stats()
var can_laser:bool = true
var can_grenade:bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta):
	#movement
	var direction : Vector2 = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	#shooting
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		can_laser = false
		Globals.laser_amount -= 1
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser.emit(selected_marker.global_position, player_direction)
		
		$LaserTimer.start()
		$GPUParticles2D.emitting = true
	#grenade
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		can_grenade = false
		Globals.grenade_amount -= 1
		var pos = $ProjectileStartPositions.get_children()[0].global_position
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade.emit(pos, player_direction)
		$GrenadeTimer.start()

func _on_laser_timer_timeout():
	can_laser = true 

func _on_grenade_timer_timeout():
	can_grenade = true

func add_item(type : String) -> void:
	if type == 'laser':
		Globals.laser_amount += 5
	elif type == 'grenade':
		Globals.grenade_amount += 1
	update_stats.emit()
	
