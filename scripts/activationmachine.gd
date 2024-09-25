extends Area3D

@export var activation_menu: CanvasLayer
@export var player_path: NodePath
var player: Node3D
var keycard_collected = false  # New variable to track keycard collection

# Ready function to set up initial settings
func _ready():
	player = get_node(player_path)
	
	if activation_menu != null:
		# Debug check for the "Buttons" node path
		var buttons_node = activation_menu.get_node("Buttons")
		if buttons_node == null:
			print("Buttons node not found!")  # Notify if the path is incorrect
		else:
			print("Buttons node found!")
	
	# Assume keycard script is at a known path or instance
	var keycard = get_node("activation_menu/key/key2")  # Adjust the path as necessary
	if keycard and keycard.has_method("keycard_activated"):
		keycard.connect("keycard_activated", Callable(self, "_on_keycard_collected"))

# New function to handle keycard collection
func _on_keycard_collected():
	keycard_collected = true  # Set to true when the keycard is collected
	print("Keycard collected!")

# Function to handle collision or interaction with the activation machine
func _on_body_entered(body):
	if keycard_collected:  # Only open the activation menu if keycard is collected
		activation_menu.visible = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		print("Keycard not collected yet.")

# Exit the activation menu when all buttons are pressed
func _exit_activation_menu():
	if activation_menu:
		activation_menu.visible = false
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
