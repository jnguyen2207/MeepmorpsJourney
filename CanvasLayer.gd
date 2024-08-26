extends CanvasLayer

func _on_picked_up():
	$KeycardIcon.show()  # Show the keycard icon or text
	$Timer.start()  # Start the timer to hide it later

func _on_timer_timeout():
	$KeycardIcon.hide()  # Hide the keycard icon or text after timeout
