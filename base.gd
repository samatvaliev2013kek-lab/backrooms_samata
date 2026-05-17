extends TouchScreenButton

@onready var tip = $Tip

var max_distance: float = 80.0
var is_pressed: bool = false

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if event.index == get_index():
			if event is InputEventScreenTouch and event.pressed:
				is_pressed = true
			
			var local_pos = get_local_mouse_position()
			var direction = local_pos.normalized()
			var distance = local_pos.length()
			
			if distance > max_distance:
				local_pos = direction * max_distance
			
			tip.position = local_pos
			
			_release_all()
			
			if local_pos.x < -10:
				Input.action_press("left")
			if local_pos.x > 10:
				Input.action_press("right")
			if local_pos.y < -10:
				Input.action_press("forward")
			if local_pos.y > 10:
				Input.action_press("backward")
	
	if event is InputEventScreenTouch and not event.pressed:
		if event.index == get_index():
			is_pressed = false
			tip.position = Vector2.ZERO
			_release_all()

func _release_all():
	Input.action_release("left")
	Input.action_release("right")
	Input.action_release("forward")
	Input.action_release("backward")
