extends Node

var magic_amnt: float  = 0.0
signal magic_amnt_updated(magic_amnt: float)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func modify_magic_amnt(magic: float):
	magic_amnt += magic
	magic_amnt_updated.emit(magic_amnt)
