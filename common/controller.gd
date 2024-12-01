extends Node2D

var current_scene : Node = null

var _is_handling_movement : bool = true

@export var player : Player = preload("res://Player.tscn").instantiate()

func _ready():
	current_scene = get_tree().root.get_node("MainMenu")
	assert(current_scene)
	pass
	
func goto_scene(scene_name : String, init_position : Vector2 = Vector2.INF) -> void:
	call_deferred("_deferred_goto_scene", scene_name, init_position);
	
func _deferred_goto_scene(scene_name : String, init_position : Vector2) -> void:
	if (current_scene):
		current_scene.remove_child(player)
		get_tree().root.remove_child(current_scene);
		current_scene.free();
	var s = ResourceLoader.load(scene_name)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene);
	current_scene.add_child(player)
	player.position = (current_scene as Room).last_position
	
	
	if (init_position != Vector2.INF):
		(current_scene.get_node("Player") as Node2D).position = init_position;
		
	
func set_handling_movement(value : bool):
	_is_handling_movement = value

func is_handling_movement():
	return _is_handling_movement
