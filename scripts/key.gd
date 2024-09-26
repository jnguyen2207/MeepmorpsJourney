extends Area3D

# Signal to notify when the keycard is picked up
signal picked_up
signal keycard_activated  # Signal emitted when keycard is collected

# Variables to control the bobbing motion
var bobbing_speed = 3.5
var bobbing_height = 0.25
var initial_position

# Rotation speed
var rotation_speed = Vector3(0, 1, 0)  # Rotating around the Y-axis

# Called when the node is added to the scene
func _ready():
	initial_position = global_transform.origin

	# If the keycard was already picked up, remove it
	if Global.keycard_picked_up:
		queue_free()  # The keycard was already picked up, so remove it

# Called every frame, used for animation
func _process(delta):
	# Rotate and bob the keycard
	rotate_object_local(Vector3(0, 1, 0), rotation_speed.y * delta)
	var new_y = initial_position.y + sin(Time.get_ticks_msec() / 1000.0 * bobbing_speed) * bobbing_height
	global_transform.origin.y = new_y

# When the player interacts with the keycard
func _on_body_entered(body):
	if body.name == "player":
		# Play sound fx
		AudioManager.play("res://soundfx/click.mp3")
		
		# Notify that the keycard has been picked up
		Global.keycard_picked_up = true
		
		# Emit signal for keycard being picked up
		emit_signal("picked_up")
		
		# Activate the keyard and notify the activation machine
		activate_keycard()
		
		# Remove the keycard from the scene
		get_parent().queue_free()

# Activate the keycard, this will emit the 'keycard_activated' signal
func activate_keycard():
	emit_signal("keycard_activated")
