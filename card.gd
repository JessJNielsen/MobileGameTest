class_name Card
extends Control

signal card_selected(card)
@export var match_id = 1

var match_images = {
	1: "square.jpg",
	2: "circle.jpg",
	3: "star.jpg",
	4: "triangle.jpg",
	5: "sixstar.jpg",
	6: "orange_square.jpg"
}

enum states {
	HIDDEN,
	REVEALED,
	REVEALED_MATCHED,
	REVEALED_INCORRECT
}
var card_state = states.HIDDEN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()
	
func reset():
	%FrontImage.texture = load("res://assets/" + match_images[match_id])
	%FrontImage.visible = false
	%BackImage.visible = true
	card_state = states.HIDDEN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if card_state == states.HIDDEN:
		card_selected.emit(self)

	
func flip_card():
	%FrontImage.visible = true
	%BackImage.visible = false
	card_state = states.REVEALED
	
func hide_card():
	%FrontImage.visible = false
	%BackImage.visible = true
	card_state = states.HIDDEN
