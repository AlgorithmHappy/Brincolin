extends Node2D

var personaje: String
const plataforma_rosa = "res://Escenas/Plataforma.tscn"
const plataforma_verde = "res://Escenas/PlataformaRosa.tscn"
var scene_plataforma_rosa
var scene_plataforma_verde
var ultima_plataforma_y = -900
var dificultad = 1
var cangurejo

func _ready():
	randomize()
	scene_plataforma_rosa = preload(plataforma_rosa)
	scene_plataforma_verde = preload(plataforma_verde)
	personaje = Global_Vars.player_dir
	print(personaje)
	var escena = load(personaje)
	var instancia = escena.instance()
	instancia.velocidad_brinco = 850
	instancia.position.y = 0
	add_child(instancia)
	personaje = instancia.name
	for i in range(-7, 10):
		i = i * -100
		cargar_plataforma(i)

func _process(delta):
	cangurejo = get_node(personaje)
	if cangurejo.position.y < ultima_plataforma_y + 448:
		agregar_nuevas_plataformas()
		eliminar_plataformas()
	if cangurejo.position.y > cangurejo.get_child(2).limit_bottom + 70:
		game_over()

func cargar_plataforma(posicion_y):
	var plataforma
	if rand_range(0, 1) <= 0.51:
		plataforma = scene_plataforma_verde.instance()
	else:
		plataforma = scene_plataforma_rosa.instance()
	plataforma.position.x = rand_range(0, 504)
	plataforma.position.y = posicion_y
	add_child(plataforma)
	
func agregar_nuevas_plataformas():
	var i = (randi() % dificultad) + 1
	var j = 0
	while j < i:
		var actual = ultima_plataforma_y
		ultima_plataforma_y = rand_range(actual - 310, ultima_plataforma_y)
		cargar_plataforma(ultima_plataforma_y)
		j += 1
	
func eliminar_plataformas():
	for i in get_children():
		if "Plataforma".is_subsequence_of(i.name) and (i.position.y > cangurejo.position.y + 448):
			remove_child(i)
			
func game_over():
	get_tree().change_scene("res://Escenas/GameOver.tscn")
	
	
	
	
	
	
	
	
	
	