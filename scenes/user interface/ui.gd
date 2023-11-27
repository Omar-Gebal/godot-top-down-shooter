extends CanvasLayer

#colors
@export var green : Color = Color("6bbfa3")
@export var red : Color = Color(0.9,0.1,0.1,1)

@onready var laser_label: Label = $BulletCounter/Label
@onready var grenade_label : Label = $GrenadeCounter/Label
@onready var laser_icon : TextureRect = $BulletCounter/TextureRect
@onready var grenade_icon : TextureRect = $GrenadeCounter/TextureRect

func _ready():
	update_laser()
	update_grenade()

func update_laser():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)
	
func update_color(amount: int, label : Label, icon : TextureRect):
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red
