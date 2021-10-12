extends Resource

export(String) var item_name
export(Texture) var texture
export(int) var stack_size
export(Dictionary) var properties

func _init(iname = "Item", itexture = null, istack_size = 1, iproperties = {}):
	item_name = iname
	texture = itexture
	stack_size = istack_size
	properties = iproperties
