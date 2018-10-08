tool
extends EditorPlugin

func _enter_tree():
	ProjectSettings.set_setting("Matrix Level Forge/Test", 1)
	ProjectSettings.save()

func _exit_tree():
	ProjectSettings.set_setting("Matrix Level Forge/Test", null)
	ProjectSettings.save()
