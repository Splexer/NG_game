extends base_item

func _ready():
	if text_interaction == "":
		text_interaction = "I pick up key!"

func action(_body: Player) -> void:
	Events.key_increased.emit()
