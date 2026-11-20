extends CharacterBody2D


const SPEED = 300.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()




func process_movement():
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	play_animation(direction)
	
	

func play_animation(dir: Vector2):
	if dir.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("running_side")
	if dir.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("running_side")
	if dir.y > 0:
		animated_sprite_2d.play("running_down")
	if dir.y < 0:
		animated_sprite_2d.play("running_up")
