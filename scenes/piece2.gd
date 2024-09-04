extends TextureRect

@export var is_draggable: bool = true
var dragging: bool = false
var offset: Vector2 = Vector2.ZERO

signal piece_connected  # Signal emitted when the pieces connect

func _ready():
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE  # Make sure we can receive mouse events

func _input(event: InputEvent):
	if is_draggable:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.pressed:
					if self.get_rect().has_point(event.position):
						dragging = true
						offset = event.position - self.position
				else:
					dragging = false
		elif event is InputEventMouseMotion and dragging:
			position = event.position - offset
			check_for_other_piece()  # Check for collision

func check_for_other_piece():
	var other_piece = get_node("../piece1")  # Adjust the path to the other piece
	if self.get_rect().intersects(other_piece.get_rect()):
		emit_signal("piece_connected")  # Emit signal when they connect
