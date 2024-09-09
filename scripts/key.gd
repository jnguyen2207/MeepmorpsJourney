extends Area3D

# Signal to notify when the keycard is picked up
signal picked_up

signal keycard_activated

# Variables to control the bobbing motion
var bobbing_speed = 3.5
var bobbing_height = 0.25
var initial_position

# Rotation speed
var rotation_speed = Vector3(0, 1, 0)  # Rotating around the Y-axis

func _ready():
	# Emit the signal when the keycard is activated
	emit_signal("keycard_activated")
	initial_position = global_transform.origin
	if Global.keycard_picked_up:
		queue_free()  # The keycard was already picked up, so remove it

func _process(delta):
	# Rotate and bob the keycard
	rotate_object_local(Vector3(0, 1, 0), rotation_speed.y * delta)
	var new_y = initial_position.y + sin(Time.get_ticks_msec() / 1000.0 * bobbing_speed) * bobbing_height
	global_transform.origin.y = new_y

func _on_body_entered(body):
	if body.name == "player":
		#Plays sound fx
		AudioManager.play("res://soundfx/click.mp3")
		
		#Tells the game that the kaycard has been picked up
		Global.keycard_picked_up = true
		
		#emit signal and removes the original keycard
		emit_signal("picked_up")
		get_parent().queue_free()
		

func _on_picked_up():
	activate_keycard()

func activate_keycard():
	emit_signal("keycard_activated")
