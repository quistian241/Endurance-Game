extends Node2D

@onready var timerLabel = %GameTimer
@onready var clock = %Timer

func spawn_obstacle():
	var new_obstacle = preload("res://falling_obstacle.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_obstacle.global_position = %PathFollow2D.global_position
	add_child(new_obstacle)

func _on_timer_timeout():
	spawn_obstacle()

func getTimeLabel(curTime: float):
	var mins = int(curTime / 60)
	var secs = int(curTime - mins * 60)
	var minTxt = str(mins)
	var secTxt = str(secs)
	if secs >= 10:
		return minTxt + ":" + secTxt
	else: 
		return minTxt + ":0" + secTxt
	#return ""
	
func _process(delta):
	var curTime = clock.time_left
	timerLabel.text = getTimeLabel(curTime)
