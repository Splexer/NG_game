extends CanvasLayer

@onready var HP_max = $MarginContainer/Stats_panel/VBoxContainer/HBoxContainer/HP_max_value
@onready var HP_value = $MarginContainer/Stats_panel/VBoxContainer/HBoxContainer/HP_value
@onready var keys_value = $MarginContainer/Stats_panel/VBoxContainer/HBoxContainer2/Keys_Value
@onready var message_panel = $MarginContainer/Message_panel
@onready var message = $MarginContainer/Message_panel/Message
@onready var timer = $Timer

	
func _ready():
	Events.show_HUD_message.connect(show_message)
	Events.keys_update.connect(update_stats)
	Events.player_hp_update.connect(update_stats)
	
	message_panel.hide()
	update_stats()


func update_stats() -> void:
	HP_max.text = str(Global.player_max_hp)
	HP_value.text = str(Global.player_hp)
	keys_value.text = str(Global.player_keys)


func show_message(text: String, time: float) -> void:
	message.text = text
	timer.wait_time = time
	timer.start()
	message_panel.show()


func _on_timer_timeout() -> void:
	message_panel.hide()
