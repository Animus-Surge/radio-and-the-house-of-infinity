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
	for _x in range(playerstate.inventory_slots):
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
	var first_empty
	for node in inventory.get_node("container/GridContainer").get_children():
		if node.item == item:
			var space = item.stack_size - node.stack
			if space + count > item.stack_size:
				count = (space + count) - item.stack_size
				continue
			else:
				node.amount_change(3)
				return # Nothing else needed to do, so return from the function
		elif node.item == null and first_empty == null:
			first_empty = node
			continue
	if first_empty:
		first_empty.set_item(item, count)
