extends Control

var piece1_dragged = false
var piece2_dragged = false

func _on_piece1_gui_input(event):
	if event is InputEventMouseMotion and piece1_dragged:
		position += event.relative  # Corrected from rect_position to position

func _on_piece2_gui_input(event):
	if event is InputEventMouseMotion and piece2_dragged:
		position += event.relative  # Corrected from rect_position to position

func _on_repair_button_pressed():
	if pieces_aligned():
		fix_keycard()

func pieces_aligned():
	# Logic to check if pieces are aligned correctly
	return true

func fix_keycard():
	# Logic to fix the keycard
	pass
