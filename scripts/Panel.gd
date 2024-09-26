extends CanvasLayer

@export var activation_machine: NodePath  # Reference to the activation machine script
var machine: Area3D

# Called when the node enters the scene tree for the first time
func _ready():
	machine = get_node(activation_machine)  # Get the activation machine node
	var buttons_node = get_node("Buttons")  # Get the buttons container
	
	# Check if buttons node is valid
	if buttons_node == null:
		print("Buttons node not found!")
	else:
		# Connect all buttons to the _on_button_pressed function
		for button in buttons_node.get_children():
			if button is Button:
				button.connect("pressed", Callable(self, "_on_button_pressed"))

# Function called when a button is pressed
func _on_button_pressed():
	# Check if the activation machine has the method "check_activation_complete"
	if machine.has_method("check_activation_complete"):
		if machine.check_activation_complete():  # Check if activation is complete
			_exit_activation_menu()  # Close the menu if complete
	else:
		print("The method 'check_activation_complete' is not found in the activation machine.")

# Function to close the activation menu
func _exit_activation_menu():
	self.visible = false  # Hide the activation menu
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED  # Hide the mouse cursor if needed
