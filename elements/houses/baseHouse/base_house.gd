class_name Base_house
extends Node2D


@export var is_open : bool = true
@export var house_interier_scene : PackedScene

var house_interier : Node2D

@onready var unlock_door = $UnlockDoor
@onready var confirm_panel = $Confirm_panel



func _ready():
	if is_open:
		unlock_door.show()
	else:
		unlock_door.hide()
	if house_interier_scene != null:
		house_interier = house_interier_scene.instantiate()


func close() -> void:
	is_open = false
	unlock_door.hide()
	
func open()-> void:
	is_open = true
	unlock_door.show()
	
func _on_in_area_body_entered(_body : Player)-> void:
	if house_interier_scene == null:
		return
	if is_open:
		Events.load_interier_scene.emit(house_interier)
	else:
		if Global.player_keys <= 0:
			Events.show_HUD_message.emit("I don't have the keys to open this", 2.5)
			return
		else:
			confirm_panel.show()
		

func _on_in_area_body_exited(_body : Player)-> void:
	confirm_panel.hide()


func _on_accept_btn_pressed()-> void:
	open()
	Events.key_reduced.emit()
	confirm_panel.hide()
	Events.load_interier_scene.emit(house_interier)


func _on_decline_btn_pressed()-> void:
	confirm_panel.hide()
