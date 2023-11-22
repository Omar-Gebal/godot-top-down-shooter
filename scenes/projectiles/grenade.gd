extends RigidBody2D

@export var speed = 750
func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("Explosion")
