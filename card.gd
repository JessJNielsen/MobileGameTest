extends Control

signal card_selected(card)
@export var match_id = 1
var locked = false

var match_images = {
	1: "square.jpg",
	2: "circle.jpg",
	3: "star.jpg",
	4: "triangle.jpg"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%FrontImage.texture = load("res://assets/" + match_images[match_id])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("pressed")
	if locked:
		pass
	flip_card()
	
func flip_card():
	%FrontImage.visible = !%FrontImage.visible 
	%BackImage.visible = !%BackImage.visible
	
func hide_card():
	%FrontImage.visible = false
	%BackImage.visible = true
