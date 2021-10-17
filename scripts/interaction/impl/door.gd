extends "res://scripts/interaction/interactable.gd"

var type = "door"

export(bool) var opened = false
export(bool) var has_lock = false

export(Texture) var open
export(Texture) var closed

func _body_entered(body):
	if body.type == "player":
		get_parent().interaction("Press F to interact with Door")

func _body_exited(body):
	if body.type == "player":
		get_parent().interaction_hide()

func interact():
	if has_lock:
		pass
	else:
		pass
