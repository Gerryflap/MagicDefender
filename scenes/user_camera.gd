extends Camera2D

# Camera speed in px/s
@export var camera_speed = 400

# Zoom base. Zoom level is vased on zoom_base ** zoom_exponent
@export var zoom_base = 2.0

var zoom_exponent = -2

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(2000, 900)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector2(0,0)
	
	if Input.is_action_pressed("camera_down"):
		movement.y += 1
	if Input.is_action_pressed("camera_up"):
		movement.y -= 1
	if Input.is_action_pressed("camera_left"):
		movement.x -= 1	
	if Input.is_action_pressed("camera_right"):
		movement.x += 1
	
	movement = movement.normalized() * delta * camera_speed * (zoom_base ** zoom_exponent)
	position += movement

func _input(event):
	if event.is_action_pressed("camera_zoom_in"):
		zoom_exponent -= 1
	if event.is_action_pressed("camera_zoom_out"):
		zoom_exponent += 1
	zoom = Vector2(1,1) * zoom_base ** -zoom_exponent
