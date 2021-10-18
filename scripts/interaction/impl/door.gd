extends "res://scripts/interaction/interactable.gd"

var type = "door"

export(bool) var opened = false
export(bool) var has_lock = false

export(Texture) var open
export(Texture) var closed

func _ready():
	if opened:
		has_lock = false #Door was open... this can be changed through another script, though, if needed.
		$Sprite.texture = open
		print("Open door by default")
	else:
		$Sprite.texture = closed
		print("Closed door by default")

func _body_entered(body):
	._body_entered(body)
	if body.type == "player":
		get_parent().interaction("Press F to interact with Door")

func _body_exited(body):
	._body_exited(body)
	if body.type == "player":
		get_parent().interaction_hide()

func interact():
	if has_lock:
		if not playerstate.player_keys > 0:
			get_parent().interaction("You need a key!")
			return
		has_lock = false #door was unlocked, don't want it locking behind them unless we needed to... I'll do that later
		opened = true
		playerstate.player_keys -= 1
		$Sprite.texture = open
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		if opened:
			opened = false
			$Sprite.texture = closed
			$CollisionShape2D.set_deferred("disabled", false)
		else:
			opened = true
			$Sprite.texture = open
			$CollisionShape2D.set_deferred("disabled", true)
