extends Node2D

var destination = null
var start = null
var progress: float = 0
var speed: float = 100.0
var element: String = "fire"
var total_duration: float = 0
var duration: float = 0
var direction: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	print("Projectile created!")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if destination == null:
		print("ERROR: destination is null!")
		queue_free()
	
	duration += delta
	progress = duration/total_duration
	
	position = progress * destination + (1.0 - progress) * start
		
	if progress >= 1.0:
		# TODO: Spawn effect
		print("Destination reached! ", progress)
		queue_free()
	
func init(pos: Vector2, dest: Vector2, elem: String):
	position = pos
	start = pos
	destination = dest
	var distance = (start - destination).length()
	total_duration = distance/speed
	# Since the sprite is rotated 180 degrees, we need to account for that
	rotation = start.angle_to_point(destination) + PI
