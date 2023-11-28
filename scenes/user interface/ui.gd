extends CanvasLayer

#colors
@export var green : Color = Color("6bbfa3")
@export var red : Color = Color(0.9,0.1,0.1,1)

@onready var laser_label: Label = $BulletCounter/Label
@onready var grenade_label : Label = $GrenadeCounter/Label
@onready var laser_icon : TextureRect = $BulletCounter/TextureRect
@onready var grenade_icon : TextureRect = $GrenadeCounter/TextureRect
@onready var health_bar : TextureProgressBar = $Health/TextureProgressBar

func _ready():
	Globals.connect("laser_amount_change", update_laser)
	Globals.connect("grenade_amount_change", update_grenade)
	Globals.connect("health_change", update_health)
	update_laser()
	update_grenade()
	update_health()

func update_health():
	health_bar.value = Globals.health

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
