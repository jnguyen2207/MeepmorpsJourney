extends Area3D

@export var repair_menu: CanvasLayer  # Variable linked to the CanvasLayer
@export var player_path: NodePath
var player: Node3D

func _ready():
	player = get_node(player_path)

func _on_body_entered(body: Node):
	if body.name == "player":  # Ensure you're detecting the player
		get_tree().paused = true  # Pause the game
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Unlock the mouse and show the cursor
		repair_menu.visible = true  # Show the repair menu

func open_repair_menu():
	$CanvasLayer.visible = true

func _exit_repair_menu():
	repair_menu.visible = false  # Hide the repair menu
	get_tree().paused = false  # Unpause the game
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Lock the mouse again
