extends KinematicBody2D

export(int) var speed = 10
var velocity = Vector2()

func _physics_process(delta):
	var vc = Vector2()
	vc.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vc.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = vc.normalized() * speed
	velocity = move_and_slide(velocity)
