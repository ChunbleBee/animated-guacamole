// Project: Hole Sweeper 
// Created: 21-11-02

#INCLUDE "BoardObject.agc"
#INCLUDE "ConstantsAndDefinitions.agc"

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
White = MakeColor(255,255,255)

PlayBoard As Board
PlayBoard = ConstructBoard(35, 40, 35)

Do
    Print( ScreenFPS() )

    For y = 0 To PlayBoard.YSize
    	For x = 0 To PlayBoard.XSize
    		x1 = x*10
    		x2 = x*10 + 5
    		y1 = y*10
    		y2 = y*10 + 5
   
    		If (PlayBoard.Grid[y, x].IsHill = TRUE)
    			DrawBox(x1, y1, x2, y2, LightBlue, LightBlue, LightBlue, LightBlue, TRUE)
    		Else
    			DrawBox(x1, y1, x2, y2, LightPink, LightPink, LightPink, LightPink, TRUE)
    		EndIf
    	Next x
    Next y
   
	Sync()
    // Cool!
Loop

