// Project: Hole Sweeper 
// Created: 21-11-02

#INCLUDE "ConstantsAndDefinitions.agc"
#INCLUDE "BoardObject.agc"

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Hole Sweeper" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 )

LightPink = MakeColor(255,192,203)
LightBlue = MakeColor(0,191,255)
Grey = MakeColor(128,128,128)

PlayBoard As Board
PlayBoard = ConstructBoard(35, 40, 100)
TileSize = 20

Do
    Print( ScreenFPS() )

    For y = 0 To PlayBoard.YSize - 1
    	For x = 0 To PlayBoard.XSize - 1
    		x1 = x * TileSize
    		x2 = (x + 1) * TileSize - 5
    		y1 = y * TileSize
    		y2 = (y + 1) * TileSize - 5
			
			If (PlayBoard.Grid[y, x].Revealed = TRUE)
	    		If (PlayBoard.Grid[y, x].IsHill = TRUE)
	    			DrawBox(x1, y1, x2, y2, LightBlue, LightBlue, LightBlue, LightBlue, TRUE)
	    		Else
	    			DrawBox(x1, y1, x2, y2, LightPink, LightPink, LightPink, LightPink, TRUE)
	    		EndIf
	    	Else
	    		DrawBox(x1, y1, x2, y2, Grey, Grey, Grey, Grey, TRUE)
	    	EndIf
    	Next x
    Next y
    
    If (GetPointerPressed() = TRUE) And (GetPointerX() < PlayBoard.xSize * (TileSize + 1)) And (Mod(GetPointerX(), TileSize + 5) < TileSize) And (GetPointerY() < PlayBoard.ySize * (TileSize + 1)) And (Mod(GetPointerX(), TileSize + 5) < TileSize)
    	Print("We Clicked in a box!!!")
    	xPos = GetPointerX()/TileSize
    	yPos = GetPointerY()/TileSize
    	PlayBoard.Grid[yPos, xPos].Revealed = TRUE
    EndIf
   
	Sync()
    // Cool!
Loop

