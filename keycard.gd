extends Area3D

# Signal to notify when the keycard is picked up
signal picked_up

# Variables to control the bobbing motion
var bobbing_speed = 3.5
var bobbing_height = 0.25
var initial_position

# Rotation speed
var rotation_speed = Vector3(0, 1, 0)  # Rotating around the Y-axis

func _ready():
	initial_position = global_transform.origin
	if Global.keycard_picked_up:
		queue_free()  # The keycard was already picked up, so remove it

# Rotate and bob the keycard
func _process(delta):
	rotate_object_local(Vector3(0, 1, 0), rotation_speed.y * delta)
	var new_y = initial_position.y + sin(Time.get_ticks_msec() / 1000.0 * bobbing_speed) * bobbing_height
	global_transform.origin.y = new_y

func _on_body_entered(body):
	if body.name == "player":
		#Plays sound fx
		AudioManager.play("res://soundfx/click.mp3")
		
		#Tells the game that the kaycard has been picked up
		Global.keycard_picked_up = true
		
		# Create a keycard instance in player's hand
		var keycard_scene = preload("res://models used/keycard2.tscn")
		var keycard_instance = keycard_scene.instantiate()
		var hand = body.get_node("hand")  # Ensure the player has a "Hand" node
		hand.add_child(keycard_instance)
		
		#emit signal and removes the original keycard
		emit_signal("picked_up")
		queue_free()
		

func _on_picked_up():
	pass # Replace with function body.
