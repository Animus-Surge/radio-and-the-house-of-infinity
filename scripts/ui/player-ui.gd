extends Control

#vars

onready var interact_label = $interactLabel
onready var inventory = $ItemList

func _ready():
	interact_label.hide()
	inventory.hide()

# Interaction label
func show_label(text):
	interact_label.text = text
	interact_label.show()

func hide_label():
	interact_label.hide()

# Inventory
func show_inventory():
	inventory.clear()
	for item in playerstate.player_inventory:
		if item.empty():
			inventory.add_item("[EMPTY]")
			continue
		inventory.add_item(load(item.item).name + " Count: " + str(item.count))
	inventory.show()

func hide_inventory():
	inventory.hide()
