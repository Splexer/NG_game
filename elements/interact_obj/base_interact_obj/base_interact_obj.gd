extends StaticBody2D

class_name base_interact_object

@export var text_interaction : String
@export var time : float = 4


func use() -> void:
	Events.show_HUD_message.emit(text_interaction, time)
