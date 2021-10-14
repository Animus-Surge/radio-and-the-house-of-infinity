extends StaticBody2D

export(Texture) var tex_closed
export(Texture) var tex_open

export(bool) var unlocked = false

onready var collider = $CollisionShape2D.duplicate()

func _ready():
	if unlocked: unlock()

func unlock():
	print(unlocked)
	if unlocked: return
	if not get_parent().get_node("player").has_key : return
	unlocked = true
	$Sprite.texture = tex_open
	#remove_child(get_node("CollisionShape2D"))
	$CollisionShape2D.set_deferred("disabled", true)

func lock():
	unlocked = false
	$Sprite.texture = tex_closed
	#add_child(collider)
	$CollisionShape2D.set_deferred("disabled", false)
