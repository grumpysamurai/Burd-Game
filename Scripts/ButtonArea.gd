extends Area2D
@onready var animated_sprite_2d = $"../AnimatedSprite2D"
@onready var node_2d = $".."

func _on_body_entered(body):
	animated_sprite_2d.play("pressed")
	node_2d.raisedoor()
