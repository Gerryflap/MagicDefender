extends RigidBody2D

@export var change_dir_min_s: float = 10
@export var change_dir_max_s: float = 1
var max_speed: float = 40
var desired_speed: float = 0
var change_dir_counter: float = 0
var direction: float = 0.0
var previous_pos = Vector2(0,0)
var previous_delta: float = 0
var impatience = 0.0
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	change_direction()
	reset_change_dir()
	$AnimatedSprite2D.frame = randf_range(0, 2)
	$AnimatedSprite2D.play()
	desired_speed = randf_range(max_speed/2, max_speed)
	previous_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2(cos(direction), sin(direction)) * desired_speed
	
	impatience -= delta
	if previous_delta != 0:
		var prev_speed = (position - previous_pos).length() / previous_delta
		if prev_speed < (desired_speed / 2.0):
			impatience += delta * 2.0
	
	if impatience > 0.2:
		impatience = 0.0
		turn_around()

	change_dir_counter -= delta
	if change_dir_counter < 0:
		change_direction()
		reset_change_dir()
		
	previous_delta = delta
	previous_pos = position
	
func change_direction():
	direction = randf_range(-0.6, 0.6)
	$AnimatedSprite2D.flip_h = false

func reset_change_dir():
	change_dir_counter = randf_range(change_dir_min_s, change_dir_max_s)

func turn_around():
	if cos(direction) > 0:
		direction = direction + PI
	$AnimatedSprite2D.flip_h = true
	change_dir_counter = randf_range(change_dir_min_s, change_dir_max_s)

