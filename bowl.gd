extends Area2D

signal Point(value)

var points: int = 1
var Totals: float = 0

func _on_body_entered(body: Node2D) -> void:
	Totals += points
	Point.emit(Totals)
	body.queue_free()
