extends CPUParticles2D

@onready var timer = $Timer


func _ready():
	timer.wait_time = lifetime
	timer.timeout.connect(queue_free)



func _process(_delta):
	if emitting && timer.is_stopped():
		timer.start()
