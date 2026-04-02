extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options

func show_main_buttons():
	main_buttons.show()
	options.hide()


func show_options():
	main_buttons.hide()
	options.show()


func _ready() -> void:
	show_main_buttons()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://endurance_game.tscn")


func _on_settings_pressed() -> void:
	print("Settings pressed")
	show_options()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_close_menu_pressed() -> void:
	show_main_buttons()
