extends Node2D

func _on_gate_body_entered(body):
	print("entered")


func _on_player_laser():
	print("laser from level")


func _on_player_grenade():
	print("grenade from level")
