extends Camera2D

@export var speed: float = 500.0

func _process(delta: float):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * speed * delta
