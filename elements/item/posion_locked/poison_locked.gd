extends base_item

func _ready():
	if text_interaction == "":
		text_interaction = "Oh no! All house locked now!"


func action(_body: Player) -> void:
	Events.lock_all_houses.emit()
