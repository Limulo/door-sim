extends PDPlayer

func _ready():
	print( "now loading the patch" )
	# NOTE: in future implementation this path will be customizable
	# directly from the editor.
	var name = "_main.pd"
	var path = "/home/nicola/Documents/repos/door-sim/PureData/for_godot"
	load_patch( name, path )
	play()
	
func _exit_tree():
	print( "now unloading the patch" )
	unload_patch()