extends ProgressBar

@export var player : Player

func _ready():
	player.health_reduced.connect(update_health)
	update_health()

func update_health():
	value = player.health * 100 / player.MAX_HEALTH
