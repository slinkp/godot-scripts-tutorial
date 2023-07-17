extends Sprite2D

var speed = 400
var angular_speed = PI

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
