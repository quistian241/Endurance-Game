extends Node2D

@onready var timerLabel = %TimerLabel
@onready var clock = %Timer

@export var wave_manager : Wave_Manager
@export var fall_velocity	: Array[float]
@export var spawn_interval	: Array[float]
@export var spawn_density	: Array[int]
@export var wave_interval	: float
var array_idx
var max_idx


func _ready() -> void:
	wave_manager.wave_change.connect(update_wave)
	array_idx = 0
	max_idx = fall_velocity.size()-1
	
	wave_manager.set_velocity(fall_velocity[array_idx])
	wave_manager.set_interval(spawn_interval[array_idx])
	wave_manager.set_density(spawn_density[array_idx])
	wave_manager.set_wave_interval(wave_interval)
	wave_manager.start()
	
	update_arr_idx()


func update_wave():
	wave_manager.set_velocity(fall_velocity[array_idx])
	wave_manager.set_interval(spawn_interval[array_idx])
	wave_manager.set_density(spawn_density[array_idx])
	
	update_arr_idx()


func update_arr_idx():
	if (array_idx < max_idx):
		array_idx += 1
	else: 
		array_idx = 0


func getTimeLabel(curTime: float):
	var mins = int(curTime / 60)
	var secs = int(curTime - mins * 60)
	var minTxt = str(mins)
	var secTxt = str(secs)
	if secs >= 10:
		return minTxt + ":" + secTxt
	else: 
		return minTxt + ":0" + secTxt


func _process(_delta):
	var curTime = clock.time_left
	timerLabel.text = getTimeLabel(curTime)


func health_depleted():
	#%GameOver.visible = true
	%GameOver.show()
	get_tree().paused = true


func _on_timer_win_game() -> void:
	%StageComplete.show()
	get_tree().paused = true
