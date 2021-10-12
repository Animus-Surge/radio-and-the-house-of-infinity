extends Area2D

# TODO: item handling

export(String, "key", "item", "map", "collectible") var type = "Key"
export(Resource) var item #TODO: actually make an "item" class
export(int) var amount

func _body_entered(body):
	pass

func pick_item():
	pass
