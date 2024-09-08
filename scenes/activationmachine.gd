extends Area3D

@export var activationmenu: CanvasLayer
@export var player_path: NodePath  # Path to the player node
var player: Node3D

func _ready():
	player = get_node(player_path)  # Get the player node

func _on_body_entered(body: Node):
	if body.name == "player":  # Ensure the player has entered the area
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Show and unlock the mouse
		activationmenu.visible = true  # Show the activation menu
		player.set("movement_enabled", false)  # Disable player movement

func _exit_activation_menu():
	activationmenu.visible = false  # Hide the activation menu
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Lock the mouse again
	player.set("movement_enabled", true)  # Re-enable player movement
