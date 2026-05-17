extends Button

func _ready():
	# Подключаем сигналы нажатия и отпускания
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

func _on_button_down():
	Input.action_press("sprint")

func _on_button_up():
	Input.action_release("sprint")
