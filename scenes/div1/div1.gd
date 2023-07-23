extends CharacterBody2D

signal player_shoot(pos,dir)
signal player_grenade(pos,dir)
@export var speed: int = 500
var can_shoot: bool = true
var can_grenade: bool = true

@export var MAX_SPEED = 180
@export var ACCEL = 1000
@export var FRICTION = 1000

@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")

var MainInstances = GlobalResourceLoader.MainInstances

var player: Player = null

func _ready():
	navigation_agent.path_desired_distance = 10
	navigation_agent.target_desired_distance = 24

func set_movement_target(value: Vector2): 
	navigation_agent.target_position = value

func _physics_process(delta):
	if player == null or navigation_agent.is_target_reached(): 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	else: 
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		var direction = global_position.direction_to(next_path_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
	move_and_slide()


func _on_timer_timeout():
	if player == null: 
		player = MainInstances.Player
	if player == null: 
		return
	set_movement_target(player.global_position + player.velocity * 0.3)
