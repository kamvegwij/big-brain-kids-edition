extends Area2D

var pressed: bool = false
export var tag: String

func _process(_delta):
	if pressed:
		self.position = get_global_mouse_position()
		
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			pressed = true
		else:
			pressed = false
