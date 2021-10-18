extends Node

func _ready():
	for x in range(inventory_slots):
		player_inventory.append({})
	pass

#SINGLETON FOR PLAYER STATE

var player_inventory = []
var player_keys = 0

var inventory_slots = 20

var interactable_object

var gold = 0

#TODO: add other states as needed
