extends RigidBody2D
export(int) var velocidad_brinco
export(int) var velocidad_movimiento
var toco_plataforma : bool
var posicion_cam_max

func _ready():
	toco_plataforma = true # Replace with function body.
	posicion_cam_max = position.y + 448
	
func _process(delta):
	if position.y + 448 < posicion_cam_max:
		posicion_cam_max = position.y + 448
	$Camera2D.limit_bottom = posicion_cam_max
	if position.x < -30:
		position.x = 534
	if position.x > 534:
		position.x = -30

func _integrate_forces(state):
	rotation_degrees = 0
	if Input.is_action_pressed("ui_left"):
		set_linear_velocity(Vector2(-velocidad_movimiento, get_linear_velocity().y))
	if Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(velocidad_movimiento, get_linear_velocity().y))
	if (!Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right")):
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
	if Input.is_action_pressed("ui_select"):
		var x = get_viewport().get_mouse_position().x
		if x > 0 and x < 252:
			set_linear_velocity(Vector2(-velocidad_movimiento, get_linear_velocity().y))
		elif x >= 252 and x < 504:
			set_linear_velocity(Vector2(velocidad_movimiento, get_linear_velocity().y))
		
	if toco_plataforma:
		set_linear_velocity(Vector2(0, -velocidad_brinco))
	toco_plataforma = false

func _on_CangurejoCafe_body_entered(body):
	if body.is_in_group('plataformas'):
		toco_plataforma = true
		$AnimatedSprite.set_frame(0)
		$AnimatedSprite.play("brincar")

