extends base_item

@export var health_power : int = 1

func _ready():
	if text_interaction == "":
		text_interaction = "It's an orange orange!!"
		
func action(_body: Player) -> void:
	Global.player_max_hp_change(health_power)
	Global.player_hp_change(health_power)
