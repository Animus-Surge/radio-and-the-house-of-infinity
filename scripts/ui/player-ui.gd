extends Control

#vars

var invslot = preload("res://objects/invslot.tscn")

onready var interact_label = $interactLabel
onready var inventory = $Inventory

func _ready():
	init_inventory()
	interact_label.hide()
	inventory.hide()

# Interaction label
func show_label(text):
	interact_label.text = text
	interact_label.show()

func hide_label():
	interact_label.hide()

# Inventory
func init_inventory():
	for x in range(playerstate.inventory_slots):
		var slot = invslot.instance()
		inventory.get_node("container/GridContainer").add_child(slot)

func show_inventory():
	inventory.show()

func hide_inventory():
	inventory.hide()

func clear_inventory():
	for node in inventory.get_node("container/GridContainer").get_children():
		node.clear()

func add_item(item, count):
	#First check if any of the slots has an item matching this one
	#If yes, check if they have space
		#If not, fill the slot and create a new slot with the rest of the items
	#If no create a new slot with the item
	pass
