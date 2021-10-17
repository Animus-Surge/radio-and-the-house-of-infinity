extends Node2D

export(String) var scene_name

func _ready():
	pass

func interaction(text):
	$CanvasLayer/UI.show_label(text)

func interaction_hide():
	$CanvasLayer/UI.hide_label()
