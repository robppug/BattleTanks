extends Node
class_name Item

var id:String
var name:String
var effect:String
var cost:float

func setup(data:Dictionary) -> void:
    for k in data.keys():
        set(k, data[k])
