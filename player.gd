class_name Player
extends CharacterBody2D

@export_file("*.tscn") var next_scene

var current_interactable : Interactable = null

const SPEED = 70.0

var reach_area : Area2D

func _ready():
	reach_area = $ReachArea

func _process(delta):
	if (Controller.is_handling_movement()):
		if (Input.is_action_just_pressed("primary_action")):
			if (current_interactable):
				current_interactable._on_interact()
			else:
				print("Not interactable")
				
		if (Input.is_action_just_pressed("secondary_action")):
			var door : Door = (current_interactable as Door)
			if (door):
				door.is_locked = !door.is_locked

func _get_inputs():
	if (!Controller.is_handling_movement()):
		return
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED

func _physics_process(delta: float) -> void:
	_get_inputs()
	move_and_slide()
	
func _on_interactable_enter(interactable_area : Area2D):
	Hud.set_action_label(interactable_area.get_action_text())
	current_interactable = interactable_area
	
func _on_interactable_exit(interactable_area : Area2D):
	Hud.set_action_label("")
	current_interactable = null
	
func update_interactable():
	if (current_interactable):
		var area : Area2D = current_interactable
		_on_interactable_exit(area)
		_on_interactable_enter(area)
	
