extends Node

#SINGLETON FOR PLAYER STATE

var player_inventory = []
var player_keys = 0

var inventory_slots = 20

#Interaction format: {"object":type node, "text":type string}
var interactable_objects = [] # Will use the object at the last index of the array

var gold = 0

func add_interaction(node, text):
	interactable_objects.append({"object":node, "text":text})

func remove_interaction(node):
	for x in range(interactable_objects.size()):
		var obj = interactable_objects[x]
		if obj.object == node:
			interactable_objects.remove(x)

func update_interaction(node, text):
	for x in range(interactable_objects.size()):
		var obj = interactable_objects[x]
		if obj.object == node:
			interactable_objects[x].text = text

#TODO: add other states as needed
