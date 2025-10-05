extends CharacterBody2D

var current_state = IDLE
var is_chatting = false
var player
var player_in_chatting_zone = false

enum {
	IDLE
}

func _process(delta):
	if player_in_chatting_zone:
		if Input.is_action_just_pressed("chat"):
			print("Chatting!!!")
			run_dialogue("child")
		is_chatting = true
	if current_state == 0:
		$AnimatedSprite2D.play("idle")
	
func run_dialogue(dialogue_string):
	is_chatting = true
	Dialogic.start(dialogue_string)
	#starts dialogue
		
func choose(array):
	array.shuffle()
	return array.front()

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([1,2])
	current_state = IDLE


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_chatting_zone = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_chatting_zone = false
