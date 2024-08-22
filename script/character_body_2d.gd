extends CharacterBody2D

@onready var _animated_sprite = $anim
@export var speed = 100
@onready var sound: AudioStreamPlayer2D = $sound
var andando : bool = false 


func get_input():
	var input_direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = input_direction * speed
	
func _process(delta) :
	if velocity != Vector2.ZERO and !sound.playing:
		print("testando")
		sound.playing = true
		return
	if velocity == Vector2.ZERO:
		sound.playing = false
	

func _physics_process(delta):
	get_input()
	
	if Input.is_action_pressed("direita"):
		_animated_sprite.play("andando")
		$anim.flip_h = false
		
		
	elif Input.is_action_pressed("esquerda"):
		_animated_sprite.play("andando")
		$anim.flip_h = true
		
		
	elif Input.is_action_pressed("cima"):
		_animated_sprite.play("subindo")
		
	
	elif Input.is_action_pressed("baixo"):
		_animated_sprite.play("descendo")
		
		
	else:
		_animated_sprite.play("parado")
		
	
	move_and_slide()
		
