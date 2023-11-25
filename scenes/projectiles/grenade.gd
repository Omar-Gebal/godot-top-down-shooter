extends RigidBody2D

@export var speed = 750
func explode():
	$Explosion.visible = true
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("Explosion")
