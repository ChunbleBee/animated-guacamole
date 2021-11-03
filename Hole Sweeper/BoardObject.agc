// File: BoardObject.agc
// Created: 21-11-02

#INCLUDE "ConstantsAndDefinitions.agc"
#INCLUDE "TileObject.agc"

// We define a Board as a grid of (x,y) integer pairs.
// There must be at least 1 pair in the grid
// All x >= 0, All y >= 0
// Each (x,y) pair has a Tile associated with it.
// Those tiles can either be Holes or Hills
// count(Hills) > count(Holes)

Type Board
	XSize As Integer
	YSize As Integer
	Grid As Tile[1,1]
EndType

Function ConstructBoard(xSize As Integer, ySize As Integer, numHoles As Integer)
	size As Integer
	size = xSize*ySize
	
	tempNumHoles As Integer
	newBoard As Board
	Dim newTiles[size] As Tile
	Dim grid[ySize, xSize] As Tile
	
	newBoard.Grid = grid
	newTiles.length = size
	tempNumHoles = numHoles
	
	newBoard.XSize = xSize
	newBoard.YSize = ySize

	// Build our tiles
	For i = 0 To size
		If (tempNumHoles > 0)
			newTiles[i].IsHill = FALSE
			//newTiles[i].SpriteID = CreateSprite(HOLEIMG)
			tempNumHoles = tempNumHoles - 1
		Else
			newTiles[i].IsHill = TRUE
			//newTiles[i].SpriteID = CreateSprite(HILLIMG)
		EndIf

		newTiles[i].Revealed = FALSE
	Next i
	
	// Randomize the position of our tiles, s.t. holes aren't clumped in the first few rows.
	newTiles = RandomizeTiles(newTiles, size, numHoles)


	// Emplace the tiles onto the board
	xPos As Integer
	yPos As Integer
	For i = 0 To size-1
		yPos = i/newBoard.XSize
		xPos = Mod(i, newBoard.XSize)
		//Print("(" + Str(xPos) + ", " + Str(yPos) + ")")
		newBoard.Grid[yPos, xPos] = newTiles[i]
		//SetSpritePosition(newBoard.Grid[yPos, xPos].SpriteID, xPos*96.0, yPos*96.0)
	Next i
	
	//Be a cool kid, and return
EndFunction newBoard

Function RandomizeTiles(tiles As Tile[], size As Integer, numHoles As Integer)
	nextSwap As Integer
	temp As Tile
	Dim output[size] As Tile
	
	For i = 0 To (size - 1)
		nextSwap = Random(0, tiles.length - 1)
		output[i] = tiles[nextSwap]
		tiles.remove(nextSwap)
	Next i
EndFunction output