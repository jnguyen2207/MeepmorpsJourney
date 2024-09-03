extends Area3D

@export var player_path: NodePath
var player: Node3D

func _ready():
	player = get_node(player_path)

func _on_body_entered(body):
	if body == player:
		open_repair_menu()

func open_repair_menu():
	# This function will handle opening the repair menu
	pass
