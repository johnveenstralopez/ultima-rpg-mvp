extends Sprite

# Grid movement
const TILE_SIZE = 16
var grid_pos = Vector2(5, 5)  # Starting position

# Reference to the map
onready var tilemap = get_node("../TileMap")

# Turn-based: only allow one move at a time
var can_move = true

func _ready():
	# Position player at starting grid position
	position = grid_pos * TILE_SIZE + Vector2(TILE_SIZE/2, TILE_SIZE/2)

func _process(_delta):
	if can_move:
		handle_input()

func handle_input():
	var direction = Vector2.ZERO

	# Check for input (only one key per turn)
	if Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN
	elif Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP

	if direction != Vector2.ZERO:
		try_move(direction)

func try_move(direction):
	var new_pos = grid_pos + direction

	# Check if the new position is walkable
	if tilemap.is_walkable(int(new_pos.x), int(new_pos.y)):
		# Move to new position
		grid_pos = new_pos
		position = grid_pos * TILE_SIZE + Vector2(TILE_SIZE/2, TILE_SIZE/2)
		# In a real turn-based game, you'd trigger enemy turns here
	else:
		# Can't move there - blocked
		pass
