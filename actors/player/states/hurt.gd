## Hurt state - player takes damage
class_name PlayerHurt
extends PlayerState

var hurt_timer := 0.0
var knockback_direction := 1

func enter() -> void:
	player.animation_player.play("hurt")
	hurt_timer = 0.3  # Hurt animation duration
	
	# Apply knockback
	player.velocity.x = knockback_direction * player.knockback_force
	player.velocity.y = -player.knockback_force * 0.5
	
	# Enable invincibility
	player.is_invincible = true
	
	# Reduce health
	player.health -= 1
	
	# Emit damage signal
	player.emit_signal("player_damaged", player.health)

func _init() -> void:
	pass

func set_knockback(dir: int) -> void:
	knockback_direction = dir

func physics_update(_delta: float) -> nil:
	# Apply gravity
	player.velocity.y += player.gravity * _delta
	
	# Friction
	player.velocity.x = move_toward(player.velocity.x, 0, 5)
	
	hurt_timer -= _delta
	if hurt_timer <= 0:
		player.is_invincible = false
		if player.health <= 0:
			player.change_state("dead")
		else:
			player.change_state("idle")
