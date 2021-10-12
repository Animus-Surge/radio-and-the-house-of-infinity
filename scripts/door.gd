extends StaticBody2D

export(Texture) var tex_closed
export(Texture) var tex_open

export(bool) var unlocked = false

func _ready():
	if unlocked: unlock()
	else: lock()

func unlock():
	unlocked = true
	$Sprite.texture = tex_open
	$CollisionShape2D.disabled = true

func lock():
	unlocked = false
	$Sprite.texture = tex_closed
	$CollisionShape2D.disabled = false
