extends CustomRoom

@onready var door : Door = $Door
@onready var room_tiles : RoomTiles = $RoomTiles

var interacted_objects : Dictionary = {}

func get_room_tilemap() -> RoomTiles:
	return $RoomTiles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Input.get_signal_list())
	Hud.show_dialog_panel(" Who is knocking on the window?!")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("debug_action")):
		door.is_locked = !door.is_locked
	pass
