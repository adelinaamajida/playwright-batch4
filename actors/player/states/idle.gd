## Idle state - player stands still
class_name PlayerIdle
extends PlayerState

func enter() -> void:
	player.animation_player.play("idle")

func physics_update(_delta: float) -> nil:
	# Check for movement input
	var input_dir := Input.get_axis("move_left", "move_right")
	if input_dir != 0:
		player.change_state("run")
		return
	
	# Check for jump input
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.change_state("jump")
		return
	
	# Check for attack input
	if Input.is_action_just_pressed("attack"):
		player.change_state("attack")
		return
	
	# Check for dodge input
	if Input.is_action_just_pressed("dodge"):
		player.change_state("dodge")
		return
	
	# Apply friction when on ground
	if player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x, 0, player.friction)
