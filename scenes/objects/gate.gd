extends StaticBody2D

signal body_entered(body)

func _on_area_2d_body_entered(body):
	body_entered.emit(body)
