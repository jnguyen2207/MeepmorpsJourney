extends Area3D

# Signal to notify when the keycard is picked up
signal picked_up

func _ready():
	pass

func _on_body_entered(body):
	if body.name == "player":
		emit_signal("picked_up")
		queue_free() 


func _on_picked_up():
	pass # Replace with function body.
