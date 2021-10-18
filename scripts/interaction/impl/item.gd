extends "res://scripts/interaction/interactable.gd"

var key_texture = preload("res://assets/textures/key.png")

export(String, "key", "item", "currency") var type = "item"

export(Resource) var item = Item.new()

func _ready():
	if type == "item":
		$Sprite.texture = (item as Item).texture
	elif type == "key":
		$Sprite.texture = key_texture
	else:
		pass #TODO: texture management

# warning-ignore:unused_argument
func _body_entered(body):
	._body_entered(body)
	if body.type == "player":
		get_parent().interaction("Press F to pick up " + type)
	pass

# warning-ignore:unused_argument
func _body_exited(body):
	._body_exited(body)
	if body.type == "player":
		get_parent().interaction_hide()
	pass

func interact():
	if type == "key":
		playerstate.player_keys += 1
		queue_free()
	else:
		pass #TODO
