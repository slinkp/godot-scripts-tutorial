extends Sprite2D

var speed = 400
var angular_speed = PI
var health = 100
signal health_depleted  # Defines a custom signal as per https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html#custom-signals
signal health_changed(new_value)

func _init():
	print("Hello, world!")

func _ready():
	print("Hello, ready!")
	var timer = get_node("Paul's Cool Timer")
	timer.timeout.connect(_on_paul_timer_timeout)
	

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_button_pressed():
	print("Hello button")
	set_process(not is_processing())

func _on_paul_timer_timeout():
	# Every time the timer cycles, we flip sprite visibility on/off
	visible = not visible
	health -= 10
	health_changed.emit(health)
	if health < 10 and health >= 0:
		print("Emitting custom signal")
		health_depleted.emit()
