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

func _on_body_entered(body):
	if body.name == "player":
		emit_signal("picked_up")
		queue_free() 

func _on_picked_up():
	pass # Replace with function body.

# Rotate and bob the keycard
func _process(delta):
	rotate_object_local(Vector3(0, 1, 0), rotation_speed.y * delta)
	var new_y = initial_position.y + sin(Time.get_ticks_msec() / 1000.0 * bobbing_speed) * bobbing_height
	global_transform.origin.y = new_y
