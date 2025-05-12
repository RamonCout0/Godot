extends CharacterBody2D

var player_direction : Vector2 = Vector2(0,0)
var player_speed : float = 400.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moviment_player()


func moviment_player() -> void:
	if (Input.is_action_pressed("mov_left")):
		player_direction.x = -1
		anim.play("running")
		anim.flip_h = true
	elif (Input.is_action_pressed("mov_right")):
		player_direction.x = 1
		anim.play("running")
		anim.flip_h = false
		
	else:
		player_direction.x = 0
		anim.play("idle")
		
	if (Input.is_action_pressed("mov_up")):
		player_direction.y = -1
	elif (Input.is_action_pressed("mov_down")):
		player_direction.y = 1
	else:
		player_direction.y = 0
		
	velocity = player_direction.normalized() * player_speed 
	move_and_slide()
