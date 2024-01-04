extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_player_data_magic_amnt_updated(magic_amnt):
	text = "Magic: %.2f"%(magic_amnt) # Replace with function body.
