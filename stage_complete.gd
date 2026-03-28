extends CanvasLayer

func _ready() -> void:
	hide()

func unpause_game():
	get_tree().paused = false


func _on_retry_pressed() -> void:
	unpause_game()
	get_tree().reload_current_scene()
	hide()


func _on_main_menu_pressed() -> void:
	unpause_game()
	get_tree().change_scene_to_file("res://main_menu.tscn")
