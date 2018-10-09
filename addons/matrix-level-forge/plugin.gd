tool
extends EditorPlugin

func _enter_tree():
	ProjectSettings.set_setting("matrix_level_forge/editor_scene", "res://addons/matrix-level-forge/LevelEditor.tscn")
	var scene_settings = {
		"name": "matrix_level_forge/editor_scene",
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_FILE,
		"hint_string": "*.tscn"
	}
	ProjectSettings.add_property_info(scene_settings)
	
	ProjectSettings.set_setting("matrix_level_forge/level_template", "res://addons/matrix-level-forge/LevelTemplate.tscn")
	var template_settings = {
		"name": "matrix_level_forge/level_template",
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_FILE,
		"hint_string": "*.tscn"
	}
	ProjectSettings.add_property_info(template_settings)
	ProjectSettings.save()

func _exit_tree():
	ProjectSettings.set_setting("matrix_level_forge/editor_scene", null)
	ProjectSettings.set_setting("matrix_level_forge/level_template", null)
	ProjectSettings.save()
