class_name RoomTiles
extends TileMapLayer

func toggle_door(door : Door, tileset_id : int):
	if (!door.is_locked):
		set_cell(door.door_tile_pos, tileset_id, door.atlas_pos_opened)
	else:
		set_cell(door.door_tile_pos, tileset_id, door.atlas_pos_closed)
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
