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

# Function to handle collision or interaction with the activation machine
func _on_body_entered(body):
	if keycard_collected:  # Only open the activation menu if keycard is collected
		activation_menu.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE  # Show mouse cursor
	else:
		print("Keycard not collected yet.")

func check_activation_complete() -> bool:
	# Logic to check if all buttons have been pressed
	for button in get_node("activation_menu/Buttons").get_children():
		if button is Button and not button.pressed:
			return false
	return true
