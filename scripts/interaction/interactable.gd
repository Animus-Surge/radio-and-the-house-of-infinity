extends Node

var has_area = false
var area = null

func _ready():
	for child in get_children():
		if child is Area2D:
			area = child
			has_area = true
			break
	if has_area:
		area.connect("body_entered", self, "_body_entered")
		area.connect("body_exited", self, "_body_exited")
	else:
		push_warning("No area found. Interactions won't work")

# Area2D callbacks

# warning-ignore:unused_argument
func _body_entered(body):
	#By default, does nothing
	pass

# warning-ignore:unused_argument
func _body_exited(body):
	#By default, does nothing
	pass
