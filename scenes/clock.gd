extends Node2D

export (NodePath) var pivot_hours_path
onready var pivot_hours = get_node(pivot_hours_path)

export (NodePath) var pivot_minutes_path
onready var pivot_minutes = get_node(pivot_minutes_path)

export (NodePath) var pivot_seconds_path
onready var pivot_seconds = get_node(pivot_seconds_path)

func _ready():
	set_process(true)
	
func _process(delta):
	radian_seconds = OS.get_time()[""]	