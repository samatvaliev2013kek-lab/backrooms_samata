extends Area3D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody3D:
		var path = "res://level1.tscn"
		if ResourceLoader.exists(path):
			print("Файл найден, меняем сцену...")
			get_tree().change_scene_to_file(path)
		else:
			print("ОШИБКА: файл не найден по пути: ", path)
			print("Проверь, что сцена lelel1.tscn лежит в корне проекта")
