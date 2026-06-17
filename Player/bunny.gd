extends CharacterBody2D

const JUMP_VELOCITY = -350.0
var run_speed = 450
var jump_speed = -900
var gravity = 2500
var screen_size

func _ready():
	velocity = Vector2.ZERO
	screen_size = get_viewport_rect().size
	hide()

func _process(_delta):
	var new_anim = "idle"
	
	if velocity.y > 0:
		new_anim = "fall"
	elif velocity.x != 0:
		new_anim = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
		if velocity.y < 0:
			new_anim = "jump_horiz"
			$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		new_anim = "jump_vert"
		
	if $AnimatedSprite2D.animation != new_anim:  # Checks if the animation has changed every second so it doesn't keep playing the first frame from reassignment every frame
		$AnimatedSprite2D.animation = new_anim
		$AnimatedSprite2D.play()

func get_input():
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	
	velocity.x = 0

	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
		
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
func _physics_process(delta: float) -> void:
	get_input()
	velocity.y += gravity * delta
	move_and_slide()

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed

func start(pos):
	position = pos
	show()
