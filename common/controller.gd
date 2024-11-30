extends Node2D

var current_scene : Node = null

@export var player : Player = null
@export_file("*.tscn") var start_scene

func _ready():
	goto_scene("Bedroom")

func goto_scene(scene_name : String, init_position : Vector2 = Vector2.INF) -> void:
	call_deferred("_deferred_goto_scene", scene_name, init_position);
	
func _deferred_goto_scene(scene_name : String, init_position : Vector2) -> void:
	if (current_scene):
		get_tree().root.remove_child(current_scene);
		current_scene.free();
	var s = ResourceLoader.load(scene_name);
	current_scene = s.instantiate();
	
	get_tree().root.add_child(current_scene);
	
	if (init_position != Vector2.INF):
		(current_scene.get_node("Player") as Node2D).position = init_position;
