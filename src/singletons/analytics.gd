extends Node
class_name Analytics

func log(event:String, data:Dictionary={}) -> void:
    print("ANALYTICS:", event, data)
