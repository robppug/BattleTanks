extends Node3D

var timer:float = 0.0

func _ready() -> void:
    var base_scene = load("res://scenes/Base.tscn")
    var base = base_scene.instantiate()
    add_child(base)
    var tank_scene = load("res://scenes/Tank.tscn")
    var tank = tank_scene.instantiate()
    base.add_child(tank)
    tank.add_weapon("cannon")
    Economy.start(1)
    Economy.connect("force_gold_tick", Callable(self, "_on_force_gold"))
    var cp_scene = load("res://scenes/ControlPoint.tscn")
    var cp = cp_scene.instantiate()
    add_child(cp)
    Gacha.simulate_pulls(10)

func _process(delta:float) -> void:
    timer += delta
    if timer > 180:
        get_tree().quit()

func _on_force_gold(share:float) -> void:
    print("Force gold tick", share)
