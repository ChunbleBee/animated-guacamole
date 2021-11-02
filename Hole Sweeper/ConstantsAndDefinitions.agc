// File: ConstantsAndDefinitions.agc
// Created: 21-11-02

#CONSTANT TRUE 1
#CONSTANT FALSE 0

#CONSTANT MAXSIZE 4000000
#CONSTANT MAXCOLSIZE 2000
#CONSTANT MAXROWSIZE 2000

Global HillFileLoc As String
Global HoleFileLoc As String
Global UnknownFileLoc As String

Global HillImg, HoleImg, UnknownImg

HillFileLoc = "./media/tile11.png"
HoleFileLoc = "./media/tile2.png"
UnknownFileLoc = "./media/tile26.png"

HillImg = LoadImage(HillFileLoc)
HoleImg = LoadImage(HoleFileLoc)
UnknownImg = LoadImage(UnknownFileLoc)