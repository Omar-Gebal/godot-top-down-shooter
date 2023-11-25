extends LevelParent

func _on_gate_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)

var zoom_in_value : Vector2 = Vector2(0.8,0.8)
var zoom_out_value: Vector2 = Vector2(0.5,0.5)

func _on_house_player_entered():
	var tween  = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", zoom_in_value, 1)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", zoom_out_value,1)
