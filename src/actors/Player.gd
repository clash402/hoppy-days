extends KinematicBody2D

# PROPERTIES
signal animate

onready var jump_sfx = $SFX/JumpSFX
onready var pain_sfx = $SFX/PainSFX

const UP_NORMAL = Vector2(0, -1)
const GRAVITY = 250
const WORLD_FLOOR = 4000

const SPEED = 1200
const JUMP_IMPULSE = 4000

var velocity = Vector2(0, 0)
var lives = 3
var coins = 0
var coins_for_life_increase = 3


# DEFAULTS
func _ready():
	update_gui()


func _physics_process(delta):
	move()
	has_died()


# CUSTOM
func update_gui():
	get_tree().call_group("GUI", "update_coin_label", coins)
	get_tree().call_group("GUI", "update_lives_label", lives)


func apply_gravity():
	if is_on_floor() and velocity.y > 0:
		velocity.y = 0
	elif is_on_ceiling():
		velocity.y = 1
	else:
		velocity.y += GRAVITY


func move():
	apply_gravity()
	walk()
	jump()
	animate()
	move_and_slide(velocity, UP_NORMAL)


func walk():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		velocity.x = SPEED
	else:
		velocity.x = 0


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= JUMP_IMPULSE
		jump_sfx.play()


func boost(boost_multiplier):
	position.y -= 6
	yield(get_tree(), "idle_frame")
	velocity.y = -JUMP_IMPULSE * boost_multiplier


func animate():
	emit_signal("animate", velocity)


func did_collect_coin(coin_value):
	coins += coin_value
	life_is_increased()
	update_gui()


func life_is_increased():
	if coins % coins_for_life_increase == 0:
		lives += 1


func was_hurt(damage):
	lives -= damage
	pain_sfx.play()
	update_gui()
	has_died()


func has_fallen():
	if position.y > WORLD_FLOOR:
		get_tree().call_group("Level", "lose_game")


func is_out_of_lives():
	if lives < 0:
		get_tree().call_group("Level", "lose_game")


func has_died():
	has_fallen()
	is_out_of_lives()

