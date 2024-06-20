extends Area2D
@onready var jump_pad = $".."

func _on_body_entered(body):
	print('launching')
	jump_pad.launch()
	
