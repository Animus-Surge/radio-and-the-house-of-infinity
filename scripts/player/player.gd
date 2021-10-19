extends KinematicBody2D

var type = "player"

export(int) var speed = 10
var velocity = Vector2()

# TODO: keyboard actions
func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_F:
			if not playerstate.interactable_objects.empty():
				playerstate.interactable_objects[-1].object.interact()
		elif event.pressed and event.scancode == KEY_I:
			if get_parent().get_node("CanvasLayer/UI/Inventory").visible:
				get_parent().get_node("CanvasLayer/UI").hide_inventory()
			else:
				get_parent().get_node("CanvasLayer/UI").show_inventory()

func _physics_process(_delta):
	var vc = Vector2()
	vc.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vc.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = vc.normalized() * speed
	
	if velocity.x > 0: $Sprite.flip_h = false
	elif velocity.x < 0: $Sprite.flip_h = true
	
	velocity = move_and_slide(velocity)
