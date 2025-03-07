extends base_interact_object

@onready var anim_sprite = $AnimatedSprite2D
func _ready():
	if text_interaction == "":
		text_interaction = "It looks like a very ancient stove. Why does it still work? Does anyone actually use it?" 

func use() -> void:
	anim_sprite.play("fire")
	Events.show_HUD_message.emit(text_interaction, time)
	
