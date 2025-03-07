extends base_item

@export var health_power: int = -10

func _ready():
	if text_interaction == "":
		text_interaction = "NO, OLIVES!!!"


func action(_body:Player) -> void:
	Global.player_hp_change(health_power)
	
