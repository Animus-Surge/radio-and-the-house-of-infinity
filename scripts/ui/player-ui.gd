extends Control

#vars

onready var interact_label = $interactLabel

func _ready():
	interact_label.hide()

# Interaction label
func show_label(text):
	interact_label.text = text
	interact_label.show()

func hide_label():
	interact_label.hide()
