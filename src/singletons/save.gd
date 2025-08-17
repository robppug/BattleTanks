extends Node

var save_path:String = "user://save.json"
var data:Dictionary = {}

func load() -> void:
    if FileAccess.file_exists(save_path):
        var f := FileAccess.open(save_path, FileAccess.READ)
        data = JSON.parse_string(f.get_as_text())
        f.close()
    else:
        data = {}

func save() -> void:
    var tmp := save_path + ".tmp"
    var f := FileAccess.open(tmp, FileAccess.WRITE)
    f.store_string(JSON.stringify(data))
    f.close()
    if FileAccess.file_exists(save_path):
        DirAccess.remove_absolute(save_path)
    DirAccess.rename_absolute(tmp, save_path)
