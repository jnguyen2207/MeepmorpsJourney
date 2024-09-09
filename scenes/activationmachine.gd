extends Area3D

@export var activation_menu: CanvasLayer
@export var player_path: NodePath
var player: Node3D

func check_activation_complete() -> bool:
	# Example logic to check if all buttons have been pressed
	for button in activation_menu.get_node("Buttons").get_children():
		if button is Button and not button.pressed:
			return false
	return true

func _ready():
	player = get_node(player_path)
	if activation_menu != null:
		for button in activation_menu.get_node("Buttons").get_children():
			if button is Button:
				button.connect("pressed", Callable(self, "_on_button_pressed"))
	# Assume keycard script is at a known path or instance
	var keycard = get_node("key/key2")
	if keycard != null:
		keycard.connect("keycard_activated", Callable(self, "_exit_activation_menu"))
	else:
		print("Keycard node not found!")

func _on_button_pressed():
	# Check if all buttons have been pressed or perform any action
	if check_activation_complete():
		_exit_activation_menu()

func _exit_activation_menu():
	if activation_menu:
		activation_menu.visible = false
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
