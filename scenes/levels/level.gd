extends Node2D

var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene:PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90 
	$Projectiles.add_child(laser)
	
 

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

var zoom_in_value : Vector2 = Vector2(0.8,0.8)
var zoom_out_value: Vector2 = Vector2(0.5,0.5)
func _on_house_player_entered():
	var tween  = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", zoom_in_value, 1)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", zoom_out_value,1)
	
	
