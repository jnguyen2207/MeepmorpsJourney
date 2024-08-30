extends Area3D

func _on_area_entered(body):
	if body.name == "Player":  # Check if the player is interacting
		if Player.keycard_picked_up():  # Assuming the player has a broken keycard
			show_repair_menu()  # Function to show the repair UI

func show_repair_menu():
	# Logic to display the repair UI
	var repair_ui = preload("res://path_to_your_repair_ui_scene.tscn").instantiate()
	get_tree().root.add_child(repair_ui)
	repair_ui.position_in_parent = Vector2(...)  # Position the UI in the desired screen location
