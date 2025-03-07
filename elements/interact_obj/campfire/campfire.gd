extends base_interact_object

@onready var anim_sprite = $AnimatedSprite2D

func _ready():
	anim_sprite.hide()
	if text_interaction == "":
		text_interaction = "The embers are crackling so nicely"
	

func use()-> void:
	anim_sprite.show()
	Events.show_HUD_message.emit(text_interaction, time)
	
