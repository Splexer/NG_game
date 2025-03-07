extends Node

var levels_pool = []

var main_scene : Node2D
var current_level: Node2D 
var street : Node2D
var player : Player
var last_level_pos : Vector2

var player_max_hp: int = 10
var player_hp: int = 5
var player_keys: int = 1

@onready var street_scene : PackedScene = load("res://elements/levels/street/street.tscn")
@onready var player_scene : PackedScene = load("res://elements/player/player.tscn")
@onready var HUD_scene : PackedScene = load("res://UI/HUD/hud.tscn")

func _ready():
	street = street_scene.instantiate()
	Events.load_interier_scene.connect(load_level)
	Events.load_street_scene.connect(load_street_level)
	
	Events.key_reduced.connect(key_reduce)
	Events.key_increased.connect(key_increase)
	
	Events.lock_all_houses.connect(close_all_houses)
	
	
func set_main_scene(scene : Node2D) -> void:
	main_scene = scene
	main_scene.add_child(player_scene.instantiate())
	player = main_scene.get_node("Player")
	main_scene.add_child(HUD_scene.instantiate())


func load_street_level() -> void:
	load_level(street)


func add_level_in_pool(level: Node2D) -> void:
	if level in levels_pool:
		return
	levels_pool.append(level)


func load_level(level: Node2D) -> void:
	if current_level:
		main_scene.call_deferred("remove_child", current_level)
	if levels_pool.find(level) == -1:
		add_level_in_pool(level)
	var spawn_pos = level.get_node_or_null("Spawn_Pos")
	if spawn_pos:
		spawn_pos = spawn_pos.global_position
	if level.is_in_group("levels") and last_level_pos != Vector2.ZERO:
		player.global_position = last_level_pos
	else:	
		last_level_pos = player.global_position + Vector2(0, 15)
		player.global_position = spawn_pos 
	current_level = level
	main_scene.call_deferred("add_child", current_level)


func close_all_houses()-> void:
	for house in get_tree().get_nodes_in_group("houses"):
		house.close()


func player_hp_change(count: int)-> void:
	if player_hp + count > player_max_hp:
		player_hp = player_max_hp
	else:
		player_hp += count	
	if player_hp <= 0:
		game_over()
	Events.player_hp_update.emit()


func player_max_hp_change(count: int)-> void:
	player_max_hp += count
	Events.player_hp_update.emit()


func key_increase()-> void:
	player_keys += 1
	Events.keys_update.emit()


func key_reduce()-> void:
	if player_keys > 0:
		player_keys -= 1
		Events.keys_update.emit()


func game_over()-> void:
	get_tree().quit()
