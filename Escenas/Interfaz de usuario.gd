extends Control

func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Escenas/Juego.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Escenas/Seleccion de personaje.tscn")


func _on_TextureButton3_pressed():
	get_tree().quit()
