extends Node2D

@export_file("*.tscn") var menu_scene
var is_in_menu : bool = true

@export_file("*.tscn") var start_scene
var current_scene : Node = null

var _is_handling_movement : bool = true

var current_tileset_id : int = 2 

@export var player : Player

func _ready():
	current_scene = get_tree().root.get_node("MainMenu")
	assert(current_scene)
	pass
	
func goto_scene(scene_name : String, move_player :bool = true) -> void:
	call_deferred("_deferred_goto_scene", scene_name, move_player);
	
func _deferred_goto_scene(scene_name : String, move_player : bool) -> void:
	if (move_player):
		is_in_menu = false
	else:
		is_in_menu = true
	
	if (current_scene):
		if (move_player and current_scene.get_children().has(player)):
			current_scene.remove_child(player)
		get_tree().root.remove_child(current_scene);
		current_scene.free();
	var s = ResourceLoader.load(scene_name)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene);
	
	if (move_player):
		current_scene.add_child(player)
		player.position = (current_scene as CustomRoom).last_position
	
	
func set_handling_movement(value : bool):
	_is_handling_movement = value

func is_handling_movement():
	return _is_handling_movement
	
func start_game():
	assert(start_scene)
	if (current_scene and current_scene.get_children().has(player)):
		current_scene.remove_child(player)
		player = null
		
	player = preload("res://Player.tscn").instantiate()
	goto_scene(start_scene)
	
func quit_game():
	get_tree().quit()
	
func goto_main_menu():
	goto_scene(menu_scene, false)
	
func toggle_time():
	if (is_in_menu):
		return
	var old_id : int = current_tileset_id
	var room_tiles : RoomTiles = (current_scene.get_node("RoomTiles") as RoomTiles)
	if (current_tileset_id == 2):
		current_tileset_id = 1
		room_tiles.set_tile_set(preload("res://rooms/past_rooms.tres"))
	else:
		current_tileset_id = 2
		room_tiles.set_tile_set(preload("res://rooms.tres"))
	room_tiles.notify_runtime_tile_data_update()
	
	
	
	
