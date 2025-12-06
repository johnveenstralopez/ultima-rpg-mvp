extends TileMap

# Map dimensions
const MAP_WIDTH = 30
const MAP_HEIGHT = 20

# Tile types (we'll use indices from our tileset)
const TILE_GRASS = 0
const TILE_WATER = 1
const TILE_MOUNTAIN = 2
const TILE_FOREST = 3
const TILE_DESERT = 4

# Noise for procedural generation
var noise = OpenSimplexNoise.new()

func _ready():
	randomize()
	setup_noise()
	generate_map()

func setup_noise():
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8

func generate_map():
	for x in range(MAP_WIDTH):
		for y in range(MAP_HEIGHT):
			var noise_val = noise.get_noise_2d(x, y)
			var tile_id = get_tile_from_noise(noise_val)
			set_cell(x, y, tile_id)

func get_tile_from_noise(val):
	# Convert noise value (-1 to 1) to tile type
	if val < -0.4:
		return TILE_WATER  # Deep water
	elif val < -0.1:
		return TILE_GRASS  # Grassland/plains
	elif val < 0.2:
		return TILE_FOREST  # Forest
	elif val < 0.5:
		return TILE_DESERT  # Desert/hills
	else:
		return TILE_MOUNTAIN  # Mountains

func is_walkable(x, y):
	var tile = get_cell(x, y)
	# Water and mountains are not walkable
	return tile != TILE_WATER and tile != TILE_MOUNTAIN
