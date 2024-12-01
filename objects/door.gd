class_name Door
extends Interactable

@export var atlas_pos_opened : Vector2i
@export var atlas_pos_closed : Vector2i
@export var door_tile_pos : Vector2i

@onready var room_tilemap : RoomTiles = get_parent().get_room_tilemap()

var _is_locked: bool
@export var is_locked : bool:
	get:
		return _is_locked
	set(value):
		_is_locked = value
		if (room_tilemap):
			room_tilemap.toggle_door(self, 2)
			Controller.player.update_interactable()
		#$"../RoomTiles".toggle_door(self, 2)
		
	
@export_file("*.tscn") var scene : String

func get_action_text():
	if (is_locked):
		return "Locked"
	else:
		return "Go to " + scene.get_file().get_basename().capitalize()

func _on_interact():
	if (is_locked):
		pass
	else:
		print("Switching to scene " + scene)
		Controller.goto_scene(scene)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	room_tilemap.toggle_door(self, 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
