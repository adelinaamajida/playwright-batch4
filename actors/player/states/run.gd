## Run state - player is moving
class_name PlayerRun
extends PlayerState

func enter() -> void:
	player.animation_player.play("run")

func physics_update(_delta: float) -> nil:
	var input_dir := Input.get_axis("move_left", "move_right")
	
	# Apply movement
	player.velocity.x = input_dir * player.speed
	
	# Flip sprite based on direction
	if input_dir > 0:
		player.sprite.flip_h = false
	elif input_dir < 0:
		player.sprite.flip_h = true
	
	# Check if stopped
	if input_dir == 0:
		player.change_state("idle")
		return
	
	# Check for jump
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.change_state("jump")
		return
	
	# Check for attack
	if Input.is_action_just_pressed("attack"):
		player.change_state("attack")
		return
	
	# Check for dodge
	if Input.is_action_just_pressed("dodge"):
		player.change_state("dodge")
		return
