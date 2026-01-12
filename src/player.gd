extends CharacterBody2D

@export var vertical_speed: float = 400.0
@export var scroll_speed: float = 200.0 # Match your camera speed
@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# 1. Handle Vertical Input
	var direction := Input.get_axis("ui_up", "ui_down")
	velocity.y = direction * vertical_speed
	
	# 2. Match the horizontal scroll speed
	velocity.x = scroll_speed

	move_and_slide()
	
	# 3. Handle Animations
	if direction < 0:
		_animated_sprite.play("up")
	elif direction > 0:
		_animated_sprite.play("down")
	else:
		_animated_sprite.play("idle") # Or "default"
	
	# Clamp Y position between -600 and 600
	# (Adjust slightly, e.g., -550 and 550, if you want to keep the ship fully inside)
	position.y = clamp(position.y, -500, 500)
