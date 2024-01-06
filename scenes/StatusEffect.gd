extends Node

@export var duration_in_seconds: float = 1.0
@export var damage_per_second: float = 1.0
@onready var healthbar = get_node("../Healthbar")

func _ready():
	$DurationTimer.wait_time = duration_in_seconds
	$DurationTimer.start()
	if healthbar == null:
		print("WARNING: Cannot damage parent, no healthbar!")
		queue_free()


func _process(delta):
	var healthbar = get_node("../Healthbar")
	healthbar.add_health(-damage_per_second * delta)


func _on_duration_timer_timeout():
	queue_free()
