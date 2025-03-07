extends base_item

func _ready():
	if text_interaction == "":
		text_interaction = "TELEPORT POISON!"


func action(body:Player) -> void:
	body.random_tp()
