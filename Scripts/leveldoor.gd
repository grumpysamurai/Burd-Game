extends Area2D
@onready var timer = $Timer
@export var target : PackedScene = null

func _on_body_entered(body):
	get_tree().change_scene_to_packed(target)
