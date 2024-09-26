extends CanvasLayer

func _on_Timer_timeout():
	$KeycardText.hide()  

func _on_key_2_picked_up():
	$KeycardText.show()
	$Timer.start()
