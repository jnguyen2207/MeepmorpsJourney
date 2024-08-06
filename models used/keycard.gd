extends StaticBody3D

# Signal to notify when the keycard is picked up
signal picked_up

func _ready():
	pass

func _on_body_entered(body: Node):
	if body.name == "Player":
		emit_signal("picked_up")
		queue_free()  # Remove the keycard from the scene
