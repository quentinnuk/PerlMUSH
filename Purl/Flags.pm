#!/usr/bin/perl -w

package Purl::Flags;

use strict;

#Unused flags
#unusedFlag = 16;
#unusedFlag = 4;
#unusedFlag = 6;
#unusedFlag = 32768;

#Flags
our %flags = ();
#Cannot be seen, does not show up on WHO
$flags{"dark"} = {"value" => 1, "name" => "Dark", "symbol" => "D"};

#If player types an unmatched command, just say it instead
$flags{"autosay"} = {"value" => 2, "name" => "Autosay", "symbol" => "a"};

#Name of location visible
$flags{"unfindable"} = {"value" => 8, "name" => "Unfindable", "symbol" => "U"};

#OK to link to
$flags{"linkok"} = {"value" => 32, "name" => "Link_Ok", "symbol" => "L"};

#OK to jump to with the @teleport command.
$flags{"jumpok"} = {"value" => 64, "name" => "Jump_Ok", "symbol" => "J"};

#OK for anyone to build here
$flags{"buildok"} = {"value" => 128, "name" => "Build_Ok", "symbol" => "?"};

#Chown-able (Change Owner). Player can use the @chown command to change the 
#owner of the object. (Does not work on players. They always own themselves)
$flags{"chownok"} = {"value" => 256, "name" => "Chown_Ok", "symbol" => "C"};

#Goes home when dropped
$flags{"sticky"} = {"value" => 512, "name" => "Sticky", "symbol" => "S"};

#Part of a puzzle; a teleport or home command from this location drops all 
#objects carried.
$flags{"puzzle"} = {"value" => 1024, "name" => "Puzzle", "symbol" => "Z"};

#If true, this location can be set home (@link) for an object by anyone.
$flags{"abode"} = {"value" => 2048, "name" => "Abode", "symbol" => "A"};

#If true for a room, this location is "grand central station": players can see 
#things, hear people speak, etc., but arrivals and departures go unnoticed. 
$flags{"grand"} = {"value" => 4096, "name" => "Grand", "symbol" => "G"};

#If true for an object, any person can "sign" the object, appending a string of 
#up to 60 characters to its description.
$flags{"book"} = {"value" => 8192, "name" => "Book", "symbol" => "b"};

#This player is a wizard. #1 is always a wizard.
$flags{"wizard"} = {"value" => 16384, "name" => "Wizard", "symbol" => "W"};

#This player wants to know who @emits things.
$flags{"nospoof"} = {"value" => 65536, "name" => "Nospoof", "symbol" => "N"};

#This player is allowed to build things. Set for new players if $allowBuild is 
#set. Only a wizard can change this flag after that.
$flags{"builder"} = {"value" => 131072, "name" => "Builder", "symbol" => "B"};

#If the book flag is set, and the once flag is also set, then
#any subsequent signature replaces all previous signatures
#by the same individual. 
$flags{"once"} = {"value" => 262144, "name" => "Once", "symbol" => "1"};

