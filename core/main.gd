extends Node2D


func _ready():
	Global.set_main_scene(self)
	Events.load_street_scene.emit()
