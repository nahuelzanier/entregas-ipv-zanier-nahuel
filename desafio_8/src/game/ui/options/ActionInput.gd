tool
extends Node

onready var input = $HBoxContainer/Input
onready var action = $HBoxContainer/Action

export (String) var action_input: String setget _set_action_input
export (String) var action_name: String setget _set_action_name

func _ready() -> void:
	set_process_input(false)
	input.text = action_input
	action.text = action_name
	if !Engine.editor_hint && InputMap.has_action(action_input):
		var event: InputEvent = InputMap.get_action_list(action_input)[0]
		_set_event(event)

func _input(event:InputEvent) -> void:
	if !event is InputEventMouseMotion:
		InputMap.action_erase_events(action_input)
		InputMap.action_add_event(action_input, event)
		_set_event(event)
		set_process_input(false)
		yield(get_tree().create_timer(0.1), "timeout")
		input.grab_focus()

func _set_event(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		input.text = event.as_text().get_slice(":",1).get_slice(",",0).get_slice("=",1)
	else:
		input.text = event.as_text()

func _set_action_input(inp:String) -> void:
	action_input = inp
	if Engine.editor_hint && has_node("%Input"):
		$"%Input".text = inp

func _set_action_name(nm:String) -> void:
	action_name = nm
	if Engine.editor_hint && has_node("%Action"):
		$"%Action".text = nm


func _on_Input_pressed():
	set_process_input(false)
	input.text = "..."
	input.release_focus()
