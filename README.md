# Ultima-Style RPG MVP

A minimal viable prototype for an Ultima 1-style game built in Godot 3.x.

## Features

- **Grid-based turn-based movement** - Classic roguelike controls (arrow keys or WASD)
- **Procedurally generated map** - 30x20 tile world generated with OpenSimplex noise
- **Multiple terrain types** - Grass, water, mountains, forests, desert
- **Collision detection** - Can't walk through water or mountains
- **Camera follow** - Smooth camera tracking the player

## Controls

- **Arrow Keys** or **WASD** - Move one tile at a time
- Movement is turn-based: one keypress = one move

## How to Run

1. Open Godot 3.x
2. Import this project (select the `project.godot` file)
3. Press F5 or click the Play button
4. Walk around the procedurally generated world!

## Project Structure

```
/Godot/
├── project.godot          # Project configuration
├── scenes/
│   └── Main.tscn          # Main game scene
├── scripts/
│   ├── MapGenerator.gd    # Procedural map generation
│   ├── Player.gd          # Turn-based player controller
│   └── TileSetBuilder.gd  # (Optional) Tool to build larger tilesets
├── resources/
│   ├── tileset.tres       # TileSet resource
│   └── tiles/             # Tile images (grass, water, mountain, etc.)
└── output/                # Original 1,196 tile source files
```

## Technical Details

- **Tile Size:** 16x16 pixels
- **Map Size:** 30 tiles wide x 20 tiles tall
- **Tileset:** 5 terrain types (simplified from 1,196 available tiles)
- **Engine:** Godot 3.x
- **Rendering:** GLES2

## Terrain Types

- **Grass (ID: 0)** - Walkable plains
- **Water (ID: 1)** - Non-walkable
- **Mountain (ID: 2)** - Non-walkable
- **Forest (ID: 3)** - Walkable wooded areas
- **Desert (ID: 4)** - Walkable sandy terrain

## Next Steps

This MVP tests the core movement and exploration mechanics. Potential additions:

- NPCs and dialog system
- Combat encounters
- Inventory and equipment
- Multiple connected maps (towns, dungeons)
- Quests and objectives
- Save/load system
- More varied terrain from the full 1,196 tile collection
