extends CustomRoom

@onready var door : Door = $Door
@onready var room_tiles : RoomTiles = $RoomTiles

func toggle_door():
	if (door.is_locked):
		door.is_locked = false
		$NormalTilesOpenDoor.show()
		$NormalTiles.hide()
	else:
		door.is_locked = true
		$NormalTiles.show()
		$NormalTilesOpenDoor.hide()
		

func get_room_tilemap() -> RoomTiles:
	return $RoomTiles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Input.get_signal_list())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug_action")):
		door.is_locked = !door.is_locked
	pass
