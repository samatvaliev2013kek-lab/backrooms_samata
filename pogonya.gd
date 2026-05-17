extends Area3D

@onready var door = $door
@export var move_distance : float = 400.0  # На сколько метров вниз уедет дверь
@export var move_duration : float = 55.0  # Длительность анимации в секундах

var is_activated = false  # Чтобы дверь не срабатывала повторно

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody3D and not is_activated:
		is_activated = true
		_open_door()

func _open_door():
	var target_position = door.position + Vector3.RIGHT * move_distance
	
	var tween = create_tween()
	tween.tween_property(door, "position", target_position, move_duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
