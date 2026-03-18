## Attack state - player performs an attack
class_name PlayerAttack
extends PlayerState

var attack_timer := 0.0

func enter() -> void:
	player.animation_player.play("attack")
	attack_timer = 0.3  # Attack duration
	# Stop horizontal movement during attack
	player.velocity.x = 0
	
	# Create attack hitbox (placeholder - will be implemented in Phase 2)
	_create_attack_hitbox()

func _create_attack_hitbox() -> void:
	# Placeholder for attack hitbox creation
	# This will spawn an Area2D that detects enemies
	pass

func physics_update(_delta: float) -> nil:
	# Apply gravity
	player.velocity.y += player.gravity * _delta
	
	attack_timer -= _delta
	if attack_timer <= 0:
		player.change_state("idle")

func exit() -> void:
	# Remove attack hitbox if exists
	pass
