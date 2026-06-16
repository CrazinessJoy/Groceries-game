extends AnimatableBody2D

const JUMP_VELOCITY = -350.0
var run_speed = 350
var jump_speed = -850
var gravity = 2500
var screen_size
var velocity = 0

func _ready():
	velocity = Vector2.ZERO
	screen_size = get_viewport_rect().size
	hide()

func _process(_delta):
	$AnimatedSprite2D.animation = "idle"
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_right"
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "jump_horiz_right"
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_left"
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "jump_horiz_left"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "jump_vert"
		
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "fall"
#
#func get_input():
	#var right = Input.is_action_pressed('move_right')
	#var left = Input.is_action_pressed('move_left')
	#
	#velocity.x = 0
#
	#if right:
		#velocity.x += run_speed
	#if left:
		#velocity.x -= run_speed
		#
	#if velocity.length() > 0:
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
#
#func _physics_process(delta: float) -> void:
	#get_input()
	#velocity.y += gravity * delta
	#move_and_slide()
	#
	#if is_on_floor() and Input.is_action_just_pressed('move_up'):
		#velocity.y = jump_speed
		
func interact(): 
	await get_parent().interact_ray_scene1()   
	
	
func start(pos):
	position = pos
	show()
