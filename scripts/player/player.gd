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
			if playerstate.interactable_object: playerstate.interactable_object.interact()

func _physics_process(_delta):
	var vc = Vector2()
	vc.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vc.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = vc.normalized() * speed
	
	if velocity.x > 0: $Sprite.flip_h = false
	elif velocity.x < 0: $Sprite.flip_h = true
	
	velocity = move_and_slide(velocity)
