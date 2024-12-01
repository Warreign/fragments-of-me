class_name Room
extends Node2D

@export var last_position : Vector2

func get_room_tilemap():
	return $RoomTiles

func _ready():
	last_position = $LastPosition.position
