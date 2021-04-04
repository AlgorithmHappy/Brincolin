extends ParallaxBackground

export (int) var velocidad = 0
var movimiento = 0

func _process(delta):
	movimiento -= velocidad * delta
	set_scroll_offset(Vector2(movimiento, 0))
