extends Node

# Run this script to build the TileSet from all tiles in output folder
# This is a one-time setup script

func build_tileset():
	var tileset = TileSet.new()
	var tile_dir = "res://output/"
	var dir = Directory.new()

	if dir.open(tile_dir) == OK:
		dir.list_dir_begin(true, true)
		var file_name = dir.get_next()
		var tile_id = 0

		while file_name != "":
			if file_name.ends_with(".png"):
				var texture_path = tile_dir + file_name
				var texture = load(texture_path)

				if texture:
					tileset.create_tile(tile_id)
					tileset.tile_set_texture(tile_id, texture)
					tileset.tile_set_region(tile_id, Rect2(0, 0, 16, 16))
					tileset.tile_set_name(tile_id, file_name.get_basename())

					# Set collision for certain tiles (you can customize this)
					# For now, we'll set collision on all tiles and handle walkability in code

					tile_id += 1

			file_name = dir.get_next()

		dir.list_dir_end()

		# Save the tileset
		var err = ResourceSaver.save("res://resources/tileset.tres", tileset)
		if err == OK:
			print("TileSet created successfully with ", tile_id, " tiles!")
		else:
			print("Error saving tileset: ", err)
	else:
		print("Error opening tile directory")

func _ready():
	# Uncomment to run the builder
	# build_tileset()
	pass
