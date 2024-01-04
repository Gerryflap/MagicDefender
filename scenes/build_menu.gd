extends CanvasLayer

var selected_building = Buildings.BuildingType.NONE

signal build_building(type: Buildings.BuildingType)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PlayerData.modify_magic_amnt(delta)

func select_building(building_type: Buildings.BuildingType):
	selected_building = building_type

