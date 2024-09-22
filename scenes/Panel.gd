extends CanvasLayer

var activation_steps = 0

func check_activation_complete():
	if activation_steps >= 5:
		# Keycard is now activated
		$keycardactivationmachine._exit_activation_menu()  # Close the menu
		Global.keycard_activated = true  # Mark the keycard as activated in your global state

func _on_Button1_pressed():
	activation_steps += 1
	check_activation_complete()

func _on_Button2_pressed():
	activation_steps += 1
	check_activation_complete()

func _on_Button3_pressed():
	activation_steps += 1
	check_activation_complete()

func _on_Button4_pressed():
	activation_steps += 1
	check_activation_complete()

func _on_Button5_pressed():
	activation_steps += 1
	check_activation_complete()
