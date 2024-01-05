extends RigidBody2D

@export var change_dir_min_s: float = 10
@export var change_dir_max_s: float = 1
var max_speed: float = 1000
var speed: float = 0
var change_dir_counter: float = 0
var direction: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	change_direction()
	reset_change_dir()
	$AnimatedSprite2D.frame = randf_range(0, 2)
	$AnimatedSprite2D.play()
	speed = randf_range(max_speed/2, max_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2(cos(direction), sin(direction)) * speed * delta
	
	change_dir_counter -= delta
	if change_dir_counter < 0:
		change_direction()
		reset_change_dir()
	
func change_direction():
	direction = randf_range(-0.2, 0.2)

func reset_change_dir():
	change_dir_counter = randf_range(change_dir_min_s, change_dir_max_s)
