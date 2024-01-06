extends StaticBody2D
var target = null
var projectile = preload("res://scenes/elemental_projectile.tscn")
var can_fire = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	$ShootTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_range_entered(body):
	if body.is_in_group("enemies"):
		target = body
		if can_fire:
			can_fire = false
			fire_projectile()

func _on_area_2d_body_exited(body):
	if target == body:
		target = null

func _on_shoot_timer_timeout():
	if target != null:
		fire_projectile()
	else:
		can_fire = true
		

func fire_projectile():
	var proj = projectile.instantiate()
	var startpos = position + Vector2(0, -20)
	proj.init(startpos, target.position, "fire")
	get_node("../").add_child(proj)

func _on_healthbar_health_depleted():
	queue_free()
