extends Timer

class_name UfoTimer

@export var min_time = 3
@export var max_time = 9

func _ready():
	setup_timer()

func setup_timer():
	var timeout_value = randf_range(min_time,max_time)
	self.wait_time = timeout_value
	self.start()
