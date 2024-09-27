extends Area3D

@export var win_scene: PackedScene  # The win scene to load
@export var player_path: NodePath  # Path to the player node

var player: CharacterBody3D
var keycard_activated = false  # Set this to true when the keycard is activated

func _ready():
	player = get_node(player_path)

# This function can be called when the keycard is activated
func activate_keycard():
	keycard_activated = true

# Detect when the player collides with the rocket
func _on_body_entered(body):
	if body == player:
		if keycard_activated:
			_switch_to_win_scene()
		else:
			print("Keycard not activated yet. Can't switch to win scene.")

# Function to switch to the win scene
func _switch_to_win_scene():
	get_tree().change_scene_to_packed(win_scene)
	print("Switching to the win scene")
