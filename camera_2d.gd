extends Camera2D

@export var speed: float = 200.0  # Adjust this to control scroll speed

func _process(delta: float):
	# Vector2.RIGHT is shorthand for Vector2(1, 0)
	position += Vector2.RIGHT * speed * delta
