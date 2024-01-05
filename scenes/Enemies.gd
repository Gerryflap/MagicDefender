extends Node2D

@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1000):
		var enemy = enemy_scene.instantiate()
		enemy.position = Vector2(randf_range(0, 100), randf_range(0, 1500))
		add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
