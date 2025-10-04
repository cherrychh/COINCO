extends Node2D

@export var player_control : PlayerControl
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if player_control.direction == 1:
		sprite.flip_h = false
	elif player_control.direction == -1:
		sprite.flip_h = true

	if abs(player_control.velocity.x) > 0.0:
		animation_player.play("movement")
	else:
		animation_player.play("idle")
		
		
