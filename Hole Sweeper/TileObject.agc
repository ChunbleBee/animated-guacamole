// File: TileObject.agc
// Created: 21-11-02

// Tiles are defined as objects that are either Hills or Holes.
// Tiles are clickable.
// Clicking a Hole tile ends the game.
// Clicking a Hill tile reveals the number of Holes around it (if any).
// Clicking a Hill with no surrounding Holes reveals all connected Hills w/o surrounding Holes.

Type Tile
	IsHill As Integer
	Revealed As Integer
	Sprite As String
EndType