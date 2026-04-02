extends Node

class_name Wave_Manager
var fall_obstacle_scene = preload("res://falling_obstacle.tscn")
var fall_velocity
#var spawn_interval
var spawn_density 
#var wave_intervals

signal wave_change

#func _ready() -> void:
	##fall_obstacle = preload("res://falling_obstacle.tscn").instantiate()
	#
	### Test values OR maybe just the defaults? 
	#set_velocity(250.0)
	#set_interval(0.2)
	#set_density(4)
	#
	#print("Manager")
	#print(fall_velocity)
	#print(%MobTimer.wait_time)
	#print(spawn_density)
	#print(%WaveChanger.wait_time)

func start():
	%MobTimer.start()
	%WaveChanger.start()

func set_velocity(velocity):
	fall_velocity = velocity

func set_interval(interval):
	#spawn_interval = interval
	%MobTimer.wait_time = interval

func set_density(density):
	spawn_density = density

func set_wave_interval(interval):
	%WaveChanger.wait_time = interval

func spawn_obstacle():
	var fall_obstacle = fall_obstacle_scene.instantiate()
	fall_obstacle.fall_velocity = fall_velocity
	%PathFollow2D.progress_ratio = randf()
	fall_obstacle.global_position = %PathFollow2D.global_position
	add_child(fall_obstacle)


func _on_mob_timer_timeout() -> void:
	for i in spawn_density:
		spawn_obstacle()


func _on_wave_changer_timeout() -> void:
	wave_change.emit()
	#set_velocity(700.0)
	#set_interval(0.5)
	#set_density(1)
