extends Area2D
@onready var timer = $Timer

func _on_body_entered(body):
	body.queue_free()
	get_tree().change_scene_to_file("res://levels/level_2.tscn")
