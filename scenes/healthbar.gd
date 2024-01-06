extends Node2D

@export var max_health: float = 100
@onready var health = max_health

signal health_depleted

func _ready():
	$ProgressBar.max_value = max_health
	$ProgressBar.value = health
	$ProgressBar.visible = false

func _process(delta):
	pass

# Adds or subtracts health. 
# Blocks healing beyond max health
# Emits a signal when below or at 0 health
func add_health(amount: float):
	health = health + amount
	if health > max_health:
		health = max_health
	
	if health < 0:
		health = 0
		
	$ProgressBar.visible = health != max_health
	$ProgressBar.value = health
	if health - amount > 0 and health == 0:
		health_depleted.emit()

func get_health():
	return health
