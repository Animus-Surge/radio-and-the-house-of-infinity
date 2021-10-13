extends KinematicBody2D

var type = "player"

export(int) var speed = 10
var velocity = Vector2()

var has_key = false

# TODO: keyboard actions
func _process(delta):
	pass

func _physics_process(delta):
	var vc = Vector2()
	vc.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vc.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = vc.normalized() * speed
	
	if velocity.x > 0: $Sprite.flip_h = false
	elif velocity.x < 0: $Sprite.flip_h = true
	
	velocity = move_and_slide(velocity)
