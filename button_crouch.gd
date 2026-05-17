extends TouchScreenButton

var is_crouching = false

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	if is_crouching:
		Input.action_release("crouch")
		is_crouching = false
	else:
		Input.action_press("crouch")
		is_crouching = true
