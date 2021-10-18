extends "res://scripts/interaction/interactable.gd"

var key_texture = preload("res://assets/textures/key.png")
var currency_texture #TODO

export(String, "key", "item", "currency") var type = "item"
export(int) var number = 1

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
		get_parent().interaction("Press F to pick up " + str(number) + " " + (type if type == "key" else ("Gold" if type == "currency" else item.name)))
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
	elif type == "item":
		var resource = item.resource_path
		for x in range(playerstate.inventory_slots):
			if playerstate.player_inventory[x].empty(): continue
			if playerstate.player_inventory[x].item == resource:
				playerstate.player_inventory[x].count += number
				queue_free()
				return
		for x in range(playerstate.inventory_slots):
			if playerstate.player_inventory[x].empty():
				playerstate.player_inventory[x] = {"item":resource,"count":number}
				break
	else:
		playerstate.gold += number
	queue_free()
