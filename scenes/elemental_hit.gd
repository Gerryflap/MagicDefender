extends Node2D

@export var initial_damage = 50
@export var status_dps = 20
@export var status_duration_sec = 5

const status_effect = preload("res://scenes/status_effect.tscn")

var overlapping_bodies = null
var first = true
var processed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not processed and overlapping_bodies != null:
		for body in overlapping_bodies:
			if body.is_in_group("enemies"):
				damage(body)
		processed = true
	
func _physics_process(_delta) -> void:
	if overlapping_bodies == null and not first:
		overlapping_bodies = $Area2D.get_overlapping_bodies()
	first = false

func _on_timer_timeout():
	queue_free()

func damage(body):
	var healthbar = body.get_node("Healthbar")
	if healthbar == null:
		print("Cannot damage body, no healthbar present: ", body)
		queue_free()
	else:
		var se_instance = status_effect.instantiate()
		se_instance.duration_in_seconds = status_duration_sec
		se_instance.damage_per_second = status_dps
		body.add_child(se_instance)
		healthbar.add_health(-initial_damage)
