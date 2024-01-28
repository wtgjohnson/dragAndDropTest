extends TextureRect

@export var dragged_from = false

func _notification(what):
	if what == NOTIFICATION_DRAG_END:
		if is_drag_successful():
			dragged_from = false
		elif dragged_from:
			texture=ResourceLoader.load("res://small_Basic_red_dot.png")

func _get_drag_data(at_position):
	
	var preview_texture = TextureRect.new()
 
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
 
	var preview = Control.new()
	preview.add_child(preview_texture)
 
	set_drag_preview(preview)
	dragged_from=true
	
	texture=null

	return preview_texture.texture
 
func _can_drop_data(_pos, data):
	return data is Texture2D
 
func _drop_data(_pos, data):
	texture = data
