extends CharacterBody2D

# Movement parameters
@export var speed := 400.0
@export var jump_force := 600.0
@export var gravity := 980.0
@export var friction := 20.0
@export var dodge_speed := 500.0
@export var knockback_force := 300.0

# Health
@export var max_health := 5
var health := max_health

# State
var current_state: PlayerState
var states := {}
var is_invincible := false

# Nodes
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

# State machine setup
func _ready() -> void:
	# Set up collision layers (Section 1)
	# Layer 1: World, Layer 2: Player, Layer 3: Enemies, Layer 4: Player_Attack, Layer 5: Breakable
	set_collision_layer_value(1, true)  # World
	set_collision_layer_value(2, true)  # Player
	
	# Initialize states
	states = {
		"idle": $states/idle,
		"run": $states/run,
		"jump": $states/jump,
		"attack": $states/attack,
		"dodge": $states/dodge,
		"hurt": $states/hurt,
		"dead": $states/dead
	}
	
	# Set up each state
	for state_name in states:
		var state = states[state_name]
		state.player = self
	
	# Start in idle state
	change_state("idle")

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Update current state
	if current_state:
		current_state.physics_update(delta)
	
	# Move
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

## Change to a new state
func change_state(state_name: String) -> void:
	if not states.has(state_name):
		push_warning("State not found: " + state_name)
		return
	
	# Exit current state
	if current_state:
		current_state.exit()
	
	# Enter new state
	current_state = states[state_name]
	current_state.enter()

## Take damage
func take_damage(damage: int, knockback_dir: int) -> void:
	if is_invincible:
		return
	
	health -= damage
	
	# Trigger hurt state with knockback
	if current_state.has_method("set_knockback"):
		current_state.set_knockback(knockback_dir)
	
	change_state("hurt")
	
	# Check for death
	if health <= 0:
		change_state("dead")

## Get current health
func get_health() -> int:
	return health

## Get max health
func get_max_health() -> int:
	return max_health
