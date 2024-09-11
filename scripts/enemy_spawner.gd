extends Node2D

@export var enemy_rescource = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var rn = RandomNumberGenerator.new()
	var randomNumber = rn.randf_range(0, 1150)
	var enemy = enemy_rescource.instantiate()
	
	add_child(enemy)
	enemy.global_position = Vector2(randomNumber, 0)
