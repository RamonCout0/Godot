extends CharacterBody2D

var player_direction : Vector2 = Vector2(0,0)
const player_speed : float = 400.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moviment_player(delta)


func moviment_player(delta: float) -> void:
	var velocity = Input.get_vector("mov_left","mov_right","mov_up","mov_down")
	
	if (velocity.length() > 0):
		velocity = velocity.normalized() * player_speed
		
	if (velocity.x != 0):
		anim.play("running_left")
	elif (velocity.y > 0):
		anim.play("running_down")
	elif (velocity.y < 0):
		anim.play("running_up")
	else:
		anim.play("idle")
		
	anim.flip_h = true if velocity.x > 0 else false
	
	position += velocity * delta
