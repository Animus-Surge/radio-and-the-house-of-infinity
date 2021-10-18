extends "res://scripts/interaction/interactable.gd"

var type = "npc"

export(Dictionary) var interaction

func _ready():
	pass

func _body_entered(body):
	._body_entered(body)
	if body.type == "player":
		pass

func _body_exited(body):
	._body_exited(body)

func interact():
	pass
