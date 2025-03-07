extends Node2D

class_name base_item

@export var text_interaction : String
@export var time : float = 4

func _on_area_2d_body_entered(body: Player) -> void:
	Events.show_HUD_message.emit(text_interaction, time)
	action(body)
	queue_free()

func action(_body: Player) -> void: 
	pass
