class_name CustomRoom
extends Node2D

var scene_file : String

@export var last_position : Vector2

func get_room_tilemap():
	return $RoomTiles

func _ready():
	if ($RoomTiles):
		if (Controller.current_tileset_id == 1):
			$RoomTiles.set_tile_set(preload("res://rooms/past_rooms.tres"))
		else:
			$RoomTiles.set_tile_set(preload("res://rooms.tres"))
	last_position = $InitialPosition.position
