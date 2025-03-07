extends base_item

@export var health_power : int = -1

func _ready():
	if text_interaction == "":
		text_interaction = "So spicy pepper!"
		
		
func action(_body: Player) -> void:
	Global.player_hp_change(health_power)
