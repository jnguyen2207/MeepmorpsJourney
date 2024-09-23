extends Area3D

@export var activation_menu: CanvasLayer
@export var player_path: NodePath
var player: Node3D

# This function is called when a button is pressed
func _on_button_pressed():
	# Check if activation_menu has the method "check_activation_complete"
	if activation_menu.has_method("check_activation_complete"):
		if activation_menu.check_activation_complete():
			_exit_activation_menu()
	else:
		print("The method 'check_activation_complete' is not found in activation_menu.")

# Ready function to set up initial settings
func _ready():
	player = get_node(player_path)
	if activation_menu != null:
		# Connect all buttons in the "Buttons" node to the "_on_button_pressed" function
		for button in activation_menu.get_node("Buttons").get_children():
			if button is Button:
				button.connect("pressed", Callable(self, "_on_button_pressed"))

	# Assume keycard script is at a known path or instance
	var keycard = get_node("key/key2")  # Adjust the path as necessary
	if keycard and keycard.has_method("keycard_activated"):
		keycard.connect("keycard_activated", Callable(self, "_exit_activation_menu"))
	else:
		print("Keycard node or method 'keycard_activated' not found.")

# Exit the activation menu when all buttons are pressed
func _exit_activation_menu():
	if activation_menu:
		activation_menu.visible = false
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
