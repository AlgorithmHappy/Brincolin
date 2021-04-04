extends Control

func _ready():
	pass 

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Escenas/Interfaz de usuario.tscn")

func _on_ConejoRosa_pressed():
	Global_Vars.player_dir = "res://Escenas/CangurejoRosa.tscn"
	$JugadorSeleccionado.set_text("Seleccionaste al personaje Rosa")

func _on_ConejoCafe_pressed():
	Global_Vars.player_dir = "res://Escenas/CangurejoCafe.tscn"
	$JugadorSeleccionado.set_text("Seleccionaste al personaje Cafe")
