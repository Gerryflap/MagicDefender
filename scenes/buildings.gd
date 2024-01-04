class_name Buildings

enum BuildingType {
	STABLE_MAGIC_COLLECTOR,
	BASIC_TURRET,
	NONE
}

func get_cost(type: BuildingType) -> float:
	match type:
		BuildingType.STABLE_MAGIC_COLLECTOR:
			return 10_000
		BuildingType.BASIC_TURRET:
			return 1000
		_:
			return -1
