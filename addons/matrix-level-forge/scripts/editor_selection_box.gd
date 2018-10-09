extends Control

var grabbed = false
var offset = Vector2()

func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	focus_mode = Control.FOCUS_ALL

func _draw():
	if has_focus():
		draw_rect(Rect2(Vector2(), rect_size), Color(1, 0, 0), false)

func _on_mouse_entered():
	grab_focus()
	update()

func _gui_input(event):
	if event.is_action("editor_place"):
		offset = owner.global_position - get_global_mouse_position()
		grabbed = Input.is_action_pressed("editor_place")
	
	if event.is_action_pressed("editor_delete"):
		owner.queue_free()

func _process(delta):
	if grabbed:
		if has_focus():
			var grid_size = 1
			if get_tree().has_meta("grid_size"):
				grid_size = get_tree().get_meta("grid_size")
			owner.global_position = (get_global_mouse_position() + offset).snapped(Vector2(1, 1))

func _on_mouse_exited():
	release_focus()
	update()
