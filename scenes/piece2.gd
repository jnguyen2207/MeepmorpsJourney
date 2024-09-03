extends TextureRect

@export var is_draggable: bool = true
var dragging: bool = false
var offset: Vector2 = Vector2.ZERO

func _ready():
	self.mouse_filter = Control.MOUSE_FILTER_PASS  # Ensure the TextureRect can receive mouse events

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
