extends Node

var weapons = []
var balance = {}
var tanks = []
var items = []
var creeps = []
var cp = {}
var waves = []
var economy = {}
var droptables = {}

func _ready():
    load_all()

func load_json(path:String):
    var file := FileAccess.open(path, FileAccess.READ)
    var text := file.get_as_text()
    file.close()
    var json := JSON.parse_string(text)
    return json

func load_all():
    weapons = load_json("res://data/weapons.tres").weapons
    balance = load_json("res://data/balance.tres")
    tanks = load_json("res://data/tanks.tres").tanks
    items = load_json("res://data/items.tres").items
    creeps = load_json("res://data/creeps.tres").creeps
    cp = load_json("res://data/cp.tres").control_points
    waves = load_json("res://data/waves.tres").waves
    economy = load_json("res://data/economy.tres")
    droptables = load_json("res://data/droptables.tres")
