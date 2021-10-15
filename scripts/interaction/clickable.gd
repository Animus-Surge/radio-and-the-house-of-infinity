extends Node

#Clickable and interactable are two different things.

#Clickable allows the object to be clicked on if in a certain range,
#interactable allows the object to be interacted with by the character itself

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		pass #TODO: check if player is within interaction range
