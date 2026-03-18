## Jump state - player is jumping
class_name PlayerJump
extends PlayerState

func enter() -> void:
	player.animation_player.play("jump")
	# Apply jump velocity
	player.velocity.y = -player.jump_force

func physics_update(_delta: float) -> nil:
	var input_dir := Input.get_axis("move_left", "move_right")
	player.velocity.x = move_toward(player.velocity.x, input_dir * player.speed, 0.5)
	
	# Flip sprite
	if input_dir > 0:
		player.sprite.flip_h = false
	elif input_dir < 0:
		player.sprite.flip_h = true
	
	# Apply gravity
	player.velocity.y += player.gravity * _delta
	
	# Check for attack in air
	if Input.is_action_just_pressed("attack"):
		player.change_state("attack")
		return
	
	# Check for dodge in air
	if Input.is_action_just_pressed("dodge"):
		player.change_state("dodge")
		return
	
	# Check if landed
	if player.is_on_floor():
		player.change_state("idle")
