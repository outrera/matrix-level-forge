extends Node2D

func _ready():
	pause_mode = PAUSE_MODE_PROCESS
	if !get_tree().get_meta("in_editor"):
		queue_free()
