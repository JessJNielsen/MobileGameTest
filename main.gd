
extends Node2D

var first_selected_card
var second_selected_card

enum states {
	SHOW_ERROR,
	GAME_OVER,
	RUNNING
}
var game_state = states.RUNNING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_reset()
	
	var cards = %CardGrid.get_children()
	for card in cards:
		card.card_selected.connect(_on_card_selected)

func _on_card_selected(card: Card):
	if game_state != states.RUNNING:
		return
	
	if !first_selected_card:
		first_selected_card = card
		first_selected_card.flip_card()
	else:
		if first_selected_card != card:
			second_selected_card = card
			second_selected_card.flip_card()
			_check_for_match()

func _check_for_match():
	if first_selected_card.match_id == second_selected_card.match_id:
		print("match")
	else:
		game_state = states.SHOW_ERROR
		await get_tree().create_timer(0.5).timeout
		first_selected_card.hide_card()
		second_selected_card.hide_card()
	
	first_selected_card = null
	second_selected_card = null
	game_state = states.RUNNING


func _reset():
	var cards = %CardGrid.get_children()
	var ids = [1,1,2,2,3,3,4,4,5,5,6,6]
	ids.shuffle()
	for i in range(cards.size()):
		cards[i].match_id = ids[i]
		cards[i].reset()
