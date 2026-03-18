## Base class for all player states
class_name PlayerState
extends Node

## Reference to the player character
var player: CharacterBody2D

## Called when entering this state
func enter() -> void:
	pass

## Called when exiting this state
func exit() -> void:
	pass

## Called every frame
func update(_delta: float) -> void:
	pass

## Called every physics frame
func physics_update(_delta: float) -> void:
	pass

## Handle input events
func handle_input(_event: InputEvent) -> void:
	pass
