extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hit ready!", position)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlapping_bodies = $Area2D.get_overlapping_bodies()
	for body in overlapping_bodies:
		if body.is_in_group("enemies"):
			body.queue_free()
			

func _on_timer_timeout():
	queue_free()
