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
	Grid As Tile[MAXCOLSIZE, MAXROWSIZE]
EndType

Function ConstructBoard(xSize As Integer, ySize As Integer, numHoles As Integer)
	newBoard As Board
	newBoard.XSize = xSize
	newBoard.YSize = ySize
	newTiles As Tile[MAXSIZE] // Because we can't define the size of an array at runtime... le sigh, Basic.
	
	size As Integer
	tempNumHoles As Integer
	size = xSize*ySize
	tempNumHoles = numHoles

	// Build our tiles
	For i = 0 To size
		If (tempNumHoles > 0)
			newTiles[i].IsHill = FALSE
			newTiles[i].SpriteID = CreateSprite(HOLEIMG)
			numHoles = tempNumHoles - 1
		Else
			newTiles[i].IsHill = TRUE
			newTiles[i].SpriteID = CreateSprite(HILLIMG)
		EndIf

		newTiles[i].Revealed = FALSE
	Next i
	
	// Randomize the position of our tiles, s.t. holes aren't clumped in the first few rows.
	newTiles = RandomizeTiles(newTiles, size, numHoles)


	// Emplace the tiles onto the board
	xPos As Integer
	yPos As Integer
	For i = 0 To size
		yPos = i/newBoard.XSize
		xPos = Mod(i, newBoard.XSize)
		newBoard.Grid[yPos, xPos] = newTiles[i]
		SetSpritePosition(newBoard.Grid[yPos, xPos].SpriteID, xPos*96.0, yPos*96.0)
	Next i
	
	//Be a cool kid, and return
EndFunction newBoard

Function RandomizeTiles(tiles As Tile[], size As Integer, numHoles As Integer)
	nextSwap As Integer
	temp As Tile
	
	For i = 0 To numHoles
		nextSwap = Random(numHoles + 1, size - 1)

		If (tiles[nextSwap].IsHill = TRUE)
			temp = tiles[nextSwap]
			tiles[nextSwap] = tiles[i]
			tiles[i] = temp
		EndIf
	Next i
EndFunction tiles