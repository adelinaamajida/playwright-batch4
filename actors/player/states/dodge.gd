## Dodge state - player performs a dodge with i-frames
class_name PlayerDodge
extends PlayerState

var dodge_timer := 0.0
var dodge_direction := 1

func enter() -> void:
	player.animation_player.play("dodge")
	dodge_timer = 0.4  # Dodge duration
	
	# Determine dodge direction
	var input_dir := Input.get_axis("move_left", "move_right")
	if input_dir == 0:
		# Dodge in facing direction if no input
		dodge_direction = -1 if player.sprite.flip_h else 1
	else:
		dodge_direction = sign(input_dir)
	
	# Apply dodge velocity
	player.velocity.x = dodge_direction * player.dodge_speed
	
	# Enable invincibility
	player.is_invincible = true

func physics_update(_delta: float) -> nil:
	# Apply reduced gravity during dodge
	player.velocity.y += player.gravity * 0.3 * _delta
	
	dodge_timer -= _delta
	if dodge_timer <= 0:
		player.is_invincible = false
		if player.is_on_floor():
			player.change_state("idle")
		else:
			player.change_state("jump")
