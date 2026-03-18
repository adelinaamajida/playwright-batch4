## Dead state - player has died
class_name PlayerDead
extends PlayerState

func enter() -> void:
	player.animation_player.play("dead")
	# Stop all movement
	player.velocity = Vector2.ZERO
	# Disable collision
	player.set_collision_layer_value(2, false)
	# Emit death signal
	player.emit_signal("player_died")

func physics_update(_delta: float) -> void:
	# Player stays still when dead
	pass
