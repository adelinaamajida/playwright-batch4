# Dinosaur Metroidvania - Game Design Document

## Project Overview
- **Project Name**: Dinosaur Metroidvania (working title)
- **Engine**: Godot 4.6.1
- **Genre**: 2D Metroidvania Action-Platformer
- **Target Length**: 8-12 hours
- **Player Character**: Pachycephalosaurus (Pachy)

---

## Core Gameplay Systems

### Player Character (Pachycephalosaurus - "Pachy")
- **Movement**: Left/Right running, Jump, Wall Slide, Single Wall Jump
- **Combat**: Headbutt attacks, charging, dodge roll
- **Abilities**: Unlockable skills throughout the game
- **Why Pachy?**:
  - Raptors can be used as regular enemies
  - Dome head enables unique combat (headbutt, charge attacks)
  - Distinctive silhouette from other dinosaurs

### Movement Mechanics
| Mechanic | Input | Description |
|----------|-------|-------------|
| Run | Arrow Keys | Basic horizontal movement |
| Jump | Z | Single jump from ground |
| Wall Slide | Jump toward wall | Slide down walls slowly |
| Wall Jump | Jump while sliding | Single jump off wall |
| Dodge | C | Quick roll/dash for evasion with i-frames |

---

## Player Combat System

### Attack Inputs & Move Trade-offs

| Move | Input | Damage | Range | Speed | Trade-off |
|------|-------|--------|-------|-------|----------|
| **Basic Headbutt** | X (tap) | Low | Short | Fast | Low damage, but spam-able |
| **Charge** | Hold X + Direction | Medium | Long | Medium | Can't change direction once started |
| **Spin Attack** | X + Down | Medium | 360° around | Medium | Brief vulnerability at start |
| **Uppercut** | X + Up | High | Vertical | Slow | Slow recovery, only hits airborne |
| **Dash Attack** | Dash + X | High | Forward burst | Fast | Uses more stamina |
| **Ground Pound** | Jump + Down in air | High | Wide ground | Slow | Takes time to land, no i-frames |

### Rage Mode - "Seeing Red"
- **Input**: Attack + Dodge (when at FULL health + FULL stamina)
- **Effect**: Speed + Damage boost temporarily
- **Trade-off**: Takes MORE damage (glass cannon)
- **Cooldown**: After use, stamina can't be full for a few seconds

### Control Scheme
```
Movement: Arrow Keys
Jump: Z
Attack: X
Dodge: C
Down: Down Arrow
```

Or Gamepad: Left Stick + Buttons

### Move Properties
- **Basic Headbutt**: Quick poke, good for single targets, can combo
- **Charge**: Good for closing distance, committed movement - vulnerable if missed
- **Spin Attack**: Hits all around, good for groups, small startup delay
- **Uppercut**: Only hits enemies above you, launches them - good for combos
- **Dash Attack**: Quick burst of damage, uses stamina
- **Ground Pound**: Big damage area, slow fall - vulnerable during descent

### Combat System
- **Attack**: Quick melee strikes with various moves
- **Dodge**: Invincibility frames during roll (uses stamina)
- **Health**: Player HP with recovery items
- **Stamina**: Used for dodge and some attacks

### Each Move Has Trade-offs
- **Speed vs Damage**: Faster attacks do less damage
- **Range vs Vulnerability**: Longer range = more committed = more vulnerable if missed
- **Utility vs Risk**: Higher damage moves have longer recovery

---

## Boss Fight Design

### Boss 1: Ankylosaurus (Armored Titan)
**Theme**: Patience and observation
**Mechanic**: 
- Player can only damage the lower body
- Must bait the Ankylosaurus into charging at walls to topple it
- When toppled, attack the vulnerable top

**Pattern**:
1. Idle → Charge attack at player
2. Player leads to wall → Boss hits wall → Toppled (vulnerable)
3. Attack while toppled → deals damage
4. Repeats with increased speed

### Boss 2: Stegosaurus (Spine Guardian)
**Theme**: Positioning and timing
**Mechanic**:
- Player can only attack from the front (belly area)
- Must avoid tail swings and back plates

**Pattern**:
1. Tail sweep attack (dodge under)
2. Charge forward
3. Turn around (attack window - front is vulnerable)
4. Repeat

### Boss 3: Triceratops (Horned Charge)
**Theme**: Agility and positioning
**Mechanic**:
- Attack only from behind
- Must constantly circle around during combat

**Pattern**:
1. Charge attack (dodge sideways)
2. Turn to face player (attack window - behind)
3. Horn thrust attack
4. Repeat with faster transitions

### Boss 4: Spinosaurus (Sail Hunter)
**Theme**: Aquatic combat - swim, swoop, and land
**Location**: Deep Swamp (semi-aquatic area)

**Mechanic**:
- Semi-aquatic - fights both in water and on land
- Can swim and swoop but must come to land to be damaged
- Back spines/sail are deadly

**Attacks**:
1. **Water Swoop**: Dives underwater, swims, then swoops up to attack
   - Player must dodge when it surfaces
2. **Sail Swipe**: While swooping out of water, swings the sail to hit player
   - The sail itself is a hitbox - avoid both body and sail
3. **Ground Slam**: Emerges and slams the ground
4. **On Land Bite**: When on land, regular bite attacks

**Damage Phase**: Must lure it onto land to deal damage - it returns to water between attacks

### Boss 5: T-Rex (Apex Predator)
**Theme**: Mastery of all mechanics - ultimate challenge
**Relationship**: Larger, stronger version of Yutyrannus with extra moves

**Base Moves (enhanced from Yutyrannus)**:
- Faster, deadlier bite attack
- Wider tail sweep
- Quicker charge attack

**Snow-Specific Attacks (Yutyrannus moves, but worse)**:
1. **Roar** (enhanced): Stuns player if not dodged/hidden
   - Stronger than Yutyrannus - longer stun duration
2. **Stomp** (enhanced): Creates massive shockwave
   - Larger radius than Yutyrannus's snow cloud

**Exclusive T-Rex Moves**:
3. **Ground Pound**: Jumps and slams down, entire screen shake
4. **Tail Whip Combo**: Two quick tail sweeps in a row

**Progression**: If you mastered Yutyrannus, you know the base patterns - but T-Rex is faster, stronger, and has extra attacks

---

## Side Bosses (Optional Encounters)

### Side Boss 1: Therizinosaurus (Scythe Reaper)
**Location**: Deep Swamp
**Theme**: Defensive patience
**Mechanic**:
- Extremely long claws that sweep horizontally
- Must dodge under the claws and counterattack
- Slow but deadly - requires patience

### Side Boss 2: Quetzalcoatlus (Sky Tyrant)
**Location**: Coastal Beach (cliff area)
**Theme**: Aerial to grounded combat

**Mechanic**:
- Flying boss - attacks from the air
- Can only be damaged when swooping low or grounded
- Cannot attack while flying high

**Phase 1 - Aerial**:
1. **Swoop Attack**: Flies down to attack, then flies back up
   - Player must dodge, can counterattack during swoop
2. **Dive Bomb**: Faster vertical dive attack

**Phase 2 - Grounded** (after enough damage):
- Lands on ground
3. **Beak Stab**: Uses its beak to stab at player
   - Quick forward thrusts
4. **Wing Slap**: Uses wings to slap nearby

**Strategy**: Lure it down by dodging its aerial attacks, then damage when grounded

### Side Boss 3: Yutyrannus (Feathered Terror)
**Location**: Snowy Highlands (NEW AREA)
**Theme**: T-Rex preview - similar base moves, snow environment twist
**Relationship**: Smaller cousin of T-Rex, similar moveset but less powerful

**Base Moves (similar to T-Rex but weaker)**:
- Basic bite attack
- Tail sweep
- Slower charge attack

**Snow-Specific Attacks (Environmental)**:
1. **Roar + Snow Fall**: Roars and shakes trees, causing snow to fall down
   - Player must dodge or take cover
   - Hit = slowed movement (like being in deep snow)
2. **Snow Stomp**: Stomps and kicks up snow from ground
   - Creates a snow cloud similar to shockwave
   - Reduces visibility + slight slow effect

**Progression**: Practice for T-Rex fight - same patterns but with snow hazards

### Side Boss 4: Giganotosaurus (Forgotten Titan)
**Location**: Secret area in Ancient Forest (unlock after T-Rex)
**Theme**: Speed Demon - faster than T-Rex, relentless combos

**Mechanic**:
- Faster but slightly less powerful than T-Rex
- More combo attacks - never stops attacking
- Tests player's endurance and consistency

**Enhanced Base Moves** (faster than T-Rex):
1. **Speed Bite**: Quick bite, faster recovery
2. **Tail Sweep Combo**: Two tail sweeps in a row
3. **Charge Attack**: Faster charge than T-Rex

**Unique Speed Moves**:
4. **Relentless flurry**: Rapid series of attacks - bite, turn, bite, tail
   - Player must find the one opening
5. **Sprint Slam**: Runs fast, jumps, slams down (mix of charge + ground pound)
6. **Dash Bite**: Quick dash forward + bite in one motion

**Strategy**: Don't try to outdamage - survive the combo and find openings between attacks

---

## New World Structure (7 Areas)
- **Starting Area**: Ancient Forest (tutorial, hub) - Giganotosaurus secret
- **Area 2**: Desert ( Ankylosaurus) - first main boss
- **Area 3**: Underground Caverns (Stegosaurus)
- **Area 4**: Coastal Beach (Triceratops) + Quetzalcoatlus (side)
- **Area 5**: Deep Swamp (Spinosaurus) + Therizinosaurus (side)
- **Area 6**: Snowy Highlands + Yutyrannus (side)
- **Area 7**: Highland Mountains (T-Rex) - final main boss

### Boss Order:
1. Ankylosaurus (Desert) - First main boss
2. Stegosaurus (Caverns)
3. Triceratops (Beach)
4. Spinosaurus (Swamp)
5. T-Rex (Highlands) - Final main boss
6. Giganotosaurus (Forest) - Secret after T-Rex

---

## Metroidvania Elements

### Ability Unlock Progression
**Type**: Skill-focused - new attack moves and abilities
**Stats**: Minimal increases only for health and stamina

**Pachy's Skill Tree**:

| Order | Ability | Type | Description |
|-------|---------|------|-------------|
| 1 | Basic Headbutt | Attack | Starting attack - quick headbutt |
| 2 | Charge | Attack | Dash forward and headbutt |
| 3 | Spin Attack | Attack | 360 spin attack (unlock after 1st boss) |
| 4 | Uppercut Headbutt | Attack | Launch enemies upward (unlock after 2nd boss) |
| 5 | Dash Attack | Attack | Attack while dashing (unlock after 3rd boss) |
| 6 | Ground Pound | Attack | Jump + slam down (unlock after 4th boss) |

**Rage Mode - "Seeing Red"** (always available after unlock):
- **Trigger**: When at FULL health AND FULL stamina, press both Attack + Dodge
- **Effect**: Temporary damage and speed boost
- **Duration**: Time-based (e.g., 5-10 seconds)
- **Trade-off**: Player takes increased damage (glass cannon)
- **Cooldown**: After use, stamina cannot reach full for a few seconds
- **Risk/Reward**: High risk = high damage output

**Stat Upgrades** (minimal):
- Health: +1 HP bar after each boss (5 total)
- Stamina: Small increase for more dodge rolls

**Unlock Method**: Defeat bosses to gain new skills
- Each boss teaches/instills a new technique
- Creates sense of progression tied to boss victories

### World Structure
- **Starting Area**: Ancient Forest (tutorial, hub - Giganotosaurus secret)
- **Area 2**: Desert ( Ankylosaurus)
- **Area 3**: Underground Caverns (Stegosaurus)
- **Area 4**: Coastal Beach (Triceratops + Quetzalcoatlus side)
- **Area 5**: Deep Swamp (Spinosaurus + Therizinosaurus side)
- **Area 6**: Snowy Highlands (Yutyrannus side)
- **Area 7**: Highland Mountains (T-Rex)

### Progression Flow
```
Forest → Desert → Caverns → Beach → Swamp → Snow Highlands → Highlands → T-Rex
   ↓        ↓         ↓         ↓        ↓          ↓            ↓
 Secret  Boss1     Boss2    Boss3    Boss4       SIDE        Boss5
(Giga)   (Ankyl)  (Stego)  (Tric)   (Spino)   (Yutyrannus)  (T-Rex)
                                                 
                                    (Quetzalcoatlus)  (Therizinosaurus)
                                          SIDE            SIDE
```

---

## Technical Implementation Guide

### 1. Collision Layers & Masks (Physics Filter)
**Purpose**: Prevent unwanted collisions (e.g., boss vs boss, player attack hitting self)

| Layer | Name | Purpose |
|-------|------|---------|
| 1 | World | Floor, walls, platforms |
| 2 | Player | Pachy character |
| 3 | Enemies | All dinosaurs |
| 4 | Player_Attack | Player attack hitboxes |
| 5 | Breakable | Breakable walls, boulders, cracked floors |

**Player Settings**:
- Layer: 2 (Player)
- Mask: 1 (World) + 3 (Enemies) + 5 (Breakable)

**Player Attack Hitbox**:
- Layer: 4 (Player_Attack)
- Mask: 3 (Enemies)

---

### 2. Composition over Inheritance
Use Components (child nodes) instead of inheritance:

- **HealthComponent**: Attach to all dinosaurs (spino, T-Rex, ankylosaurus, etc.)
- Change damage logic in one place → updates all dinosaurs
- Create reusable nodes: HitboxComponent, HurtboxComponent, StateMachine

---

### 3. Process Functions
| Function | Use For |
|----------|--------|
| _physics_process(delta) | Player movement, physics calculations |
| _process(delta) | Visuals, UI, animations |

**Critical**: Move player in `_physics_process` to ensure consistent behavior on 60Hz monitors AND 144Hz Steam Deck.

---

### 4. Input Buffer System (Responsive Controls)
**Problem**: Players quit when controls feel "stiff"

**Solutions**:
- **Coyote Time**: Allow jumping for 0.1s after leaving a ledge
- **Input Buffer**: If player presses jump 0.05s before landing, trigger it on landing
- This makes Pachy feel responsive on Steam Deck

---

### 5. State Machine Architecture
**Problem**: Large move-set creates "spaghetti code"

**Solution**: Use Pattern-based State Machine
- Each state is its own script: Idle, Run, Jump, Charge, GroundPound, Hurt, Dead
- States inherit from a base StateMachine class
- Rage Mode becomes easier: just a modifier on existing states
- Easier to add new moves without breaking existing code

**Implementation**:
```gdscript
# res://actors/player/states/state.gd
class_name PlayerState
extends Node

var player: CharacterBody2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
```

**Player Controller**:
```gdscript
# res://actors/player/player.gd
extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer

func _ready() -> void:
	for child in state_machine.get_children():
		if child is PlayerState:
			child.player = self
	state_machine.change_to("Idle")

func _physics_process(delta: float) -> void:
	state_machine.current_state.update(delta)
	move_and_slide()
```

**Movement Tuner (Inspector-ready)**:
```gdscript
@export_group("Movement Settings")
@export var speed: float = 300.0
@export var acceleration: float = 1200.0
@export var friction: float = 800.0

@export_group("Jump Settings")
@export var jump_velocity: float = -500.0
@export var gravity_scale: float = 1.0
```

---

### 6. Camera System
**Core Features**:
- **Look Ahead**: Camera shifts slightly in movement direction so player sees what's coming
- **Camera Shake**: Essential for T-Rex stomp and Pachy headbutt impact
- **Smooth Follow**: Use position_smoothing_enabled = true

**Camera Bounds**:
- VisibleOnScreenNotifier2D or Camera2D limits
- When entering new Zone, update camera.limit_left/right/top/bottom
- Prevents showing "void" outside level

**Look-Ahead Jitter Fix**:
- Camera shift can cause motion sickness if too snappy
- Use Position Smoothing + "Dead Zone" in center
- Camera shouldn't move until Pachy is far from middle

**Camera States**:
- Create Camera State Machine
- States: Follow_Player, Freeze (cutscenes), Swoosh_to_Target (door opens)

**Boss Fight Anchoring**:
- Add CameraAnchor (Marker2D) in center of arena
- Camera targets anchor during boss fight
- Player can see whole arena
- Switch back to player after fight

---

### 7. Hit-Stop (Frame Freeze)
**Combat Feel**: Make attacks feel "meaty"
- When hitting boss weak spot: pause game for 0.05-0.1 seconds
- Essential for Ankylosaurus topple, headbutt impacts
- Tiny change that makes combat 10x more satisfying

---

### 8. Metroidvania Gates (Ability-Based Progression)
**Abilities open the world**:
| Ability | Opens |
|---------|-------|
| Charge | Heavy boulders blocking Desert |
| Ground Pound | Cracked floors to Underground Caverns |
| Spin Attack | Thick vines in Deep Swamp |
| Dash | Fast barriers in Coastal Beach |

---

### 9. Boss Data Resource Files (.tres)
**Problem**: Hardcoding boss stats = balance nightmare
**Solution**: Use Resource Files
- Create BossData resource with: Health, Speed, Damage, WeakSpot
- Edit values in Inspector → no code changes needed
- Easy to balance Giganotosaurus vs T-Rex

---

### 10. Save System (Start Early!)
**Warning**: 10-hour game needs robust save
- Start in Phase 1 (not Phase 7!)
- Use simple Dictionary → convert to JSON or ConfigFile
- Save: bosses defeated, skills unlocked, collectibles, player position
- Test save/load throughout development

---

### 11. Z-Index & Visual Sorting (Depth)
For Metroidvania depth effect (player behind leaves, in front of mountains):

| Z-Index | Layer |
|---------|-------|
| -10 | Background (mountains, distant scenery) |
| 0 | Floor/Ground |
| 10 | Player |
| 20 | Foreground (leaves, branches) |

---

### 12. Resolution & Pixel Perfect (Steam Deck)
**Project Settings > Display > Window**:
- Stretch > Mode: `canvas_items`
- Stretch > Aspect: `keep`

**Project Settings > Textures**:
- Default Texture Filter: `Nearest` (for crisp pixel art)

---

### 13. Player Origin Point
**Important**: Set player's feet at origin (0, 0) for easier calculations:
- Sprite origin at top-center
- CollisionShape at bottom-center
- When player moves to x:100, y:0 → player stands on floor at y:0

---

### 14. Level Streaming (Room System)
**Problem**: Loading entire world fills Steam Deck RAM and causes lag

**Solution**: Room/Level streaming system
- Use Area2D triggers at room edges
- When player enters area → load next room, unload previous
- Use `ResourceLoader.load_threaded_request()` for seamless transitions
- Prevents "hitching" when entering new zones

---

### 15. Rage Mode Shaders (Visual Feedback)
**Problem**: Stats changes aren't visible on Steam Deck screen

**Solution**: Create CanvasLayer with ColorRect + Shader
- When Rage Mode active: apply red vignette or Chromatic Aberration
- Tells player "You are dangerous now" without animation

---

### 16. Stamina Ghosting (UI Polish)
**Problem**: Infinite dashing by rapid button tapping

**Solution**: Stamina Regen Delay
- Don't regenerate immediately after using stamina
- Wait 0.5s of idle time before regen starts
- Preserves combat balance

---

### 17. Breakables Implementation
**Layer 5: Breakable objects**
- Create BaseBreakable class
- In Charge State: check `if body.has_method("break_object"): body.break_object()`
- Same logic for boulders, wooden fences, secret walls
- Use queue_free() to destroy after break

---

### 18. Audio Manager (Global)
**Problem**: Crowded audio with 9 bosses + player

**Solution**: Create Global AudioManager (Autoload)
- `AudioManager.play_sfx("t-rex_roar")`
- Don't put AudioStreamPlayer on every boss
- Steam Deck Tip: Apply "Low Pass Filter" when paused - sounds professional

---

### 19. Pachy-Specific State Details
The general State Machine Architecture is covered in Section 5. This section covers Pachy-specific implementation.

**Charge State Details**:
- Locks Y-axis (no jumping while charging)
- Boosts X-speed significantly
- Enables damage hitbox on head
- If hits **Breakable** layer → break_object() + Camera Shake
- If hits **World** layer (solid wall) → transition to Stunned State
- Creates the "Trade-off" risk (powerful but dangerous)

**Hurt State**:
- Flinch animation plays
- Disables input for 0.2s
- Brief invincibility frames

**State Flow**:
```
Idle → Run → Jump
     ↘ Charge (X key) → Stunned (wall hit) → Idle
     ↘ Ground Pound (down + jump)
     ↘ Hurt (damage taken) → Idle
```

---

### 20. Prehistoric Level Design (Slopes)
**No cloud platforms - solid prehistoric terrain**
- Use TileMapLayers with Physics Polygons for slopes
- Pachy's Capsule Collider will "roll" up inclines smoothly
- Makes terrain feel natural, not jagged steps

---

### 21. Resource Preloader (Combat Stall Prevention)
**Problem**: Loading effects during boss fights causes stutter

**Solution**: Preloader script
- Load common combat effects (dust, sparks) at game start or level start
- Zero stutter during high-intensity fights

---

### 22. Physics Interpolation (Steam Deck Display)
**Problem**: Movement looks jittery on 120Hz/144Hz monitors

**Solution**: Enable in Project Settings
- Godot 4 has a simple checkbox for Physics Interpolation
- Pachy looks smooth on any refresh rate

---

### 23. Global Event Bus (Smart Signal Management)
**Problem**: Tracking world state (bosses killed, gates opened)

**Solution**: Create Global Event Bus (Autoload)
- Instead of Pachy finding Boss: `GameEvents.boss_died.emit("Ankylosaurus")`
- Save System and Gate System listen for signals
- Clean, decoupled code - can delete/move rooms without breaking logic

---

### 24. Navigation & AI
**Problem**: Enemies getting stuck on slopes/rocks

**Solution**: Use Godot 4's NavigationRegion2D
- Built into TileMapLayer
- "Bake" navigation mesh
- Bosses/Raptors use mesh to chase Pachy over slopes
- Won't fall into pits or get stuck

---

### 25. Steam Deck Performance & Input
**Target**: Steam Deck

**VRAM Management**:
- Level Streaming (Section 14) is critical
- Don't load too many assets at once

**Control Rebinding**:
- Include Input Remapping menu in Phase 7
- Allow mapping to Steam Deck back paddles (L4/R4)
- Godot's InputMap makes this easy

---

### 26. Coyote Time & Input Buffering (Feel)
**Problem**: Game feels "unresponsive"

**Coyote Time**:
- Allow jump for a few frames after walking off ledge
- ~0.1s grace period

**Input Buffer**:
- If player presses Jump 0.1s before landing, store input
- Auto-jump on land

**Physics Race Conditions**:
- Be careful with queue_free()
- Use `is_dead = true` boolean before death logic
- Prevents double-signals on Steam Deck

---

### 27. Persistence (World Memory)
**Pick-up Problem**:
- Collected items shouldn't reappear when returning to room

**Solution**: Global Singleton (Autoload) named GameData
- Use Dictionary to store collected item IDs: `{"room1_item5": true}`
- In item's _ready(): `if GameData.collected_items.has(my_id): queue_free()`

---

### 28. Steam Deck Optimization
**Frame Time Spikes**:
- Spawning 100 particles causes hitches on handheld
- Use GPUParticles2D instead of individual Sprite nodes
- Significantly cheaper on Steam Deck hardware

**V-Sync & Physics**:
- Enable V-Sync in Project Settings
- Test physics at 60Hz cap to match Steam Deck
- Ensure all delta multiplications are correct

---

### 29. Combat Frame Logic
**Hurtbox vs Hitbox**:
- Pacy's Hurtbox (takes damage) should be slightly smaller than Hitbox (deals damage)

**Active Frame Rule**:
- Enable Hitbox only during frames head is moving forward
- If hitbox active whole animation → combat feels "floaty"

---

### 30. Resolution Scaling (UI)
**Problem**: Steam Deck is 1280x800 (16:10), TVs are 1920x1080 (16:9)

**Solution**: Use Control Node Anchors
- Anchor UI (Health Bar, Stamina) to Top-Left or Top-Right
- Don't hard-code pixel positions
- Looks good on Deck AND when plugged into monitor

---

### 31. Screen Freeze During Transitions
**Problem**: Loading "hitch" visible to player

**Solution**: Tween fade
- When Pachy hits room-transition trigger
- Fade black CanvasLayer in/out with Tween
- Set Player process_mode = PROCESS_MODE_DISABLED while black
- Prevents falling through floor during physics wake-up

---

### 32. Arena Lock
**Metroidvania-style boss doors**:
- Use two StaticBody2D nodes ("Doors") with collision_layer = 0 initially
- Place Area2D in center of arena
- When Pachy enters:
  1. Tween doors down from ceiling
  2. Enable collision
  3. Update Camera2D limits to room edges
  4. Trigger boss intro animation

---

### 33. Arena Clean Up
**Persistence**:
- Use Global Event Bus (Section 23)
- When boss dies: `GameEvents.boss_died.emit("Ankylosaurus")`
- Doors unlock
- Auto-save checkpoint triggers

---

### 34. Pause Integrity (Steam Deck Sleep/Wake)
**Problem**: Steam Deck players use Sleep button. Game can "jolt" on wake due to time jump.

**Solution**:
- In Pause Menu: `get_tree().paused = true`
- This tells Godot to stop ALL timers and physics
- Ensures smooth wake-up with no physics glitches
- Test by putting laptop to sleep and waking during boss fight

---

### 35. UI Scalability (7-Inch Handheld Screen)
**Problem**: Detailed HUDs look great on monitor but unreadable on handheld.

**Solution**:
- Health/Stamina bars: High-contrast, thick design
- Text labels: Use Pixel Font with Outline (LabelSettings)
- Test on 1280x800 Steam Deck resolution
- Ensure readability in dark biome (Swamp)

---

### 36. Haptic Feedback (Vibration)
**Problem**: Metroidvanias feel flat without tactile response.

**Solution**:
- When implementing Hit-Stop (Section 7):
  ```gdscript
  Input.start_joy_vibration(0, 0.3, 0.5, 0.1)
  ```
- Add "thump" when Pachy headbutts walls
- Subtle haptics make 10-hour journey more immersive
- Test on actual Steam Deck (emulator not reliable)

### Scene Structure
```
res://
├── actors/
│   ├── player/
│   │   ├── player.tscn (current - needs expansion)
│   │   ├── player.gd (current - needs expansion)
│   │   └── states/ (state machine for all moves)
│   │       ├── state.gd (base template)
│   │       ├── idle.gd
│   │       ├── run.gd
│   │       ├── jump.gd
│   │       ├── charge.gd
│   │       ├── ground_pound.gd
│   │       ├── hurt.gd
│   │       └── dead.gd
│   ├── bosses/
│   │   ├── boss_base.tscn
│   │   ├── ankylosaurus.tscn
│   │   ├── stegosaurus.tscn
│   │   ├── triceratops.tscn
│   │   ├── spinosaurus.tscn
│   │   ├── trex.tscn
│   │   └── side_bosses/
│   │       ├── therizinosaurus.tscn
│   │       ├── quetzalcoatlus.tscn
│   │       ├── yutyrannus.tscn
│   │       └── giganotosaurus.tscn
├── levels/
│   ├── world_01_forest/
│   ├── world_02_desert/
│   ├── world_03_caverns/
│   ├── world_04_beach/
│   ├── world_05_swamp/
│   ├── world_06_snow_highlands/
│   └── world_07_highlands/
├── systems/
│   ├── save_system/
│   ├── ability_system/
│   ├── checkpoint_system/
│   └── collectible_system/
├── ui/
│   ├── hud/
│   ├── menus/
│   └── boss_health/
├── resources/
│   ├── abilities/
│   └── items/
└── assets/
    ├── sprites/ (placeholders)
    └── audio/ (placeholders)
```

### Key Systems to Implement
1. **Player State Machine**: Movement, combat, hurt, dead states
2. **Boss State Machine**: Idle, attack patterns, hurt, defeated
3. **Save/Load System**: Checkpoints, abilities, collectibles
4. **Ability System**: Unlockable skills
5. **Camera System**: Smooth follow with bounds

---

## Development Phases

### Phase 1: Core Player Systems
- [ ] **Collision Layers setup** (Section 1)
- [ ] Expand player controller
- [ ] **State Machine** implementation (Section 5)
- [ ] **Input Buffer** system (Section 4)
- [ ] Add wall slide mechanic
- [ ] Implement charge attack (Pachy's signature move)
- [ ] Implement dodge with i-frames
- [ ] Add combat system (headbutt, charge, damage)
- [ ] **Combat Frame Logic** (Section 29)
- [ ] Health system with invincibility
- [ ] **Coyote Time** implementation (Section 26)
- [ ] **Stamina Ghosting** (Section 16)
- [ ] **Save/Load system** (Sections 10, 27) - *do early!*
- [ ] **Player Origin** point setup (Section 13)
- [ ] **Rage Mode** with shaders (Section 15)
- [ ] **Haptic Feedback** (Section 36)

### Phase 2: Level & World Building
- [ ] **Camera System** (Section 6)
- [ ] Create placeholder tilesets
- [ ] Build test level with platforms
- [ ] **Z-Index management** (Section 11)
- [ ] **Pixel Perfect** setup (Section 12)
- [ ] **Level Streaming** (Section 14)
- [ ] **Breakables** system (Section 17)
- [ ] **Level Design with Slopes** (Section 20)
- [ ] **Physics Interpolation** (Section 22)
- [ ] **Resource Preloader** (Section 21)
- [ ] Add collectible items
- [ ] Create checkpoint system

### Phase 3: Engine & Infrastructure
- [ ] **Global Event Bus** setup (Section 23)
- [ ] **Audio Manager** (Section 18)
- [ ] **Resolution Scaling** (Section 30)
- [ ] **Persistence** system (Section 27)
- [ ] **Pause Integrity** (Section 34)
- [ ] Input mapping finalization
- [ ] Project settings optimization

### Phase 4: Boss Fight Framework
- [ ] Create base boss class
- [ ] Implement health bar UI
- [ ] Add damage feedback
- [ ] Boss intro/outro sequences
- [ ] **Hit-Stop** effect (Section 7)
- [ ] **Screen Freeze** (Section 31)
- [ ] **Arena Lock** system (Section 32)
- [ ] **Arena Clean Up** (Section 33)
- [ ] **Navigation & AI** (Section 24)
- [ ] Boss damage patterns
- [ ] Boss phase transitions

### Phase 5: Individual Boss Implementations
- [ ] Ankylosaurus boss fight
- [ ] Stegosaurus boss fight
- [ ] Triceratops boss fight
- [ ] Spinosaurus boss fight
- [ ] T-Rex boss fight (final)
- [ ] Therizinosaurus (side boss - Swamp)
- [ ] Quetzalcoatlus (side boss - Beach)
- [ ] Yutyrannus (side boss - Snow Highlands)
- [ ] Giganotosaurus (secret post-game boss)

### Phase 6: Metroidvania Systems
- [ ] Ability unlock system
- [ ] Gate/door mechanics
- [ ] Backtracking with new abilities
- [ ] World interconnection
- [ ] Ability gating puzzles
- [ ] Shortcuts and fast travel

### Phase 7: UI & Polish
- [ ] Main menu
- [ ] Pause menu
- [ ] **UI Scalability** (Section 35)
- [ ] **Input Remapping** (Section 25)
- [ ] Ability HUD
- [ ] Mini-map
- [ ] Save/Load UI
- [ ] Title screen
- [ ] Credits screen

### Phase 8: Platform Optimization
- [ ] **Steam Deck** performance tuning (Sections 25, 28)
- [ ] Controller support
- [ ] Performance profiling
- [ ] Frame rate optimization
- [ ] Input latency reduction

### Phase 9: Content Expansion
- [ ] Additional collectibles
- [ ] Secret areas
- [ ] Story elements
- [ ] Lore pickups
- [ ] New Game Plus (optional)

---

## Placeholder Assets Strategy
- **Player**: Green rectangle (current) → Colored sprite when ready
- **Bosses**: Large colored rectangles with colored hit zones
- **Tiles**: Simple colored blocks
- **Background**: Solid colors or simple gradients

---

## Next Steps
1. Confirm this design document captures your vision
2. Begin Phase 1: Core Player Systems implementation
3. Focus on movement and combat foundation first
