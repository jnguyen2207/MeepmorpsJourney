extends CanvasLayer

func _on_keycard_picked_up():
	$KeycardText.show()
	$Timer.start()

func _on_Timer_timeout():
	$KeycardText.hide()  
