class_name Player
extends CharacterBody2D

enum DIRECTION
{
	LEFT,
	RIGHT,
	UP,
	DOWN
}

var direction : DIRECTION = DIRECTION.DOWN

@export_file("*.tscn") var next_scene

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

var current_interactable : Interactable = null

const SPEED = 70.0

var reach_area : Area2D

func _ready():
	reach_area = $ReachArea
	sprite.play()

func _process(delta):
	if (Controller.is_handling_movement()):
		if (Input.is_action_just_pressed("primary_action")):
			if (current_interactable):
				current_interactable._on_interact_final()
			else:
				print("Not interactable")
				
		if (Input.is_action_just_pressed("secondary_action")):
			var door : Door = (current_interactable as Door)
			if (door):
				door.is_locked = !door.is_locked
				
		if (Input.is_action_just_pressed("toggle_time")):
			Controller.toggle_time()
			
			

func _get_inputs():
	if (!Controller.is_handling_movement()):
		return
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED
	
	if (Input.is_action_pressed("move_down")):
		direction = DIRECTION.DOWN
	if (Input.is_action_pressed("move_up")):
		direction = DIRECTION.UP
	if (Input.is_action_pressed("move_left")):
		direction = DIRECTION.LEFT
	if (Input.is_action_pressed("move_right")):
		direction = DIRECTION.RIGHT
		
		
		
func get_dir_str():
	if (direction == DIRECTION.DOWN):
		return "down"
	if (direction == DIRECTION.UP):
		return "up"
	if (direction == DIRECTION.LEFT):
		return "left"
	if (direction == DIRECTION.RIGHT):
		return "right"
		
func update_animation():
	if (velocity == Vector2.ZERO):
		sprite.play("standing_" + get_dir_str())
	else:
		sprite.play("walking_" + get_dir_str())
	

func _physics_process(delta: float) -> void:
	_get_inputs()
	update_animation()
	move_and_slide()
	
func _on_interactable_enter(interactable_area : Area2D):
	Hud.set_action_label(interactable_area.get_action_text_final())
	current_interactable = interactable_area
	
func _on_interactable_exit(interactable_area : Area2D):
	Hud.set_action_label("")
	current_interactable = null
	
func update_interactable():
	if (current_interactable):
		var area : Area2D = current_interactable
		_on_interactable_exit(area)
		_on_interactable_enter(area)
	
