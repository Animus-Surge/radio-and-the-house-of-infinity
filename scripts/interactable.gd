extends Area2D

# Set to true by default, because most cases will have this
# node as a child to the actionable node. Otherwise it'll use
# an attached Dictionary object to parse instead.
export (bool) var action_in_parent = true
export (String) var parent_action_entered
export (String) var parent_action_exited

# TODO: parse through this through various different action types,
# OR use a custom resource
export(Dictionary) var action = {}

func _ready():
	connect("body_entered", self, "_body_entered")
	connect("body_exited", self, "_body_exited")

func _body_entered(body):
	if action_in_parent and not parent_action_entered.empty():
		get_parent().call(parent_action_entered)

func _body_exited(body):
	if action_in_parent and not parent_action_exited.empty():
		get_parent().call(parent_action_exited)
