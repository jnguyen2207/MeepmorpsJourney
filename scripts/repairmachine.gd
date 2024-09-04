extends Area3D

@export var repair_menu: CanvasLayer  # Variable linked to the CanvasLayer
@export var player_path: NodePath
var player: Node3D

func _ready():
	player = get_node(player_path)

	# Get the references to both keycard pieces
	var piece1 = get_node("../../CanvasLayer/Control/piece1")  # Adjust the path to the first piece
	var piece2 = get_node("../../CanvasLayer/Control/piece2")  # Adjust the path to the second piece
	
	# Correctly connect the piece_connected signal to the _on_piece_connected function using Callable
	piece1.connect("piece_connected", Callable(self, "_on_piece_connected"))
	piece2.connect("piece_connected", Callable(self, "_on_piece_connected"))

func _on_body_entered(body: Node):
	if body.name == "Player":  # Ensure you're detecting the player
		player.player_movement_enabled = false  # Block player movement
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Unlock the mouse and show the cursor
		repair_menu.visible = true  # Show the repair menu

func _on_piece_connected():
	repair_menu.visible = false  # Hide the repair menu
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Lock the mouse again
	player.player_movement_enabled = true  # Allow player movement
	Global.keycard_fixed = true  # Set a global variable or signal that the keycard is fixed
