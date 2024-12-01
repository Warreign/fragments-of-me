class_name Room
extends CustomRoom

@onready var door : Door = $Door
@onready var room_tiles : RoomTiles = $RoomTiles

var got_tnt :bool = false
var got_lighter : bool = false

func get_room_tilemap() -> RoomTiles:
	return $RoomTiles

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug_action")):
		door.is_locked = !door.is_locked
	pass
