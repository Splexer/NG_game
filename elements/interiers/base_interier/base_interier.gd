class_name base_interier
extends Node2D


func _on_exit_area_body_entered(_body: Player) -> void:
	Events.load_street_scene.emit()
