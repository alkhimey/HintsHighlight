HintsHighlight Module
======================

**HintsHighlight** is a module for AGS ([Advanture Game Studio](http://www.adventuregamestudio.co.uk/)) engine. 

This module adds an overlay which highlights all the visible and clickable objects, hotspots and charactes.

After adding this module to a game, players can use this features when they wish to avoid "pixel hunting" and need a hint to progress with the game.

### Example
<img src="screenshots/demo.gif" width="635px" height="371px" />
<sup> Game used for this demo is <i><a href="https://github.com/adventuregamestudio/ags-templates/blob/master/Templates/Sierra-style.agt">Sierra-style </a></i> template. All rights for the shown art are reserved for the respective artists. </sup>

### Getting Started

There are three ways of adding this module to a project. This list is ordered by increasing complexity:

1. Import an `.scm` file ("_Explore Project_ -> Right Click on _Scripts_ -> _Import Script..._. Get it from the [_Releases_](https://github.com/alkhimey/HintsHighlight/releases) section on Github.
2. Create an empty script called _HintsHighlight_ through engines interface, download the source from this repository and finally copy the downloaded script over the empty one. 
3. Create an empty script called _HintsHighlight_ through engines interface and delete it from windows explorer, clone this repository, create a [**hard** link](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink) from the cloned files to your games folder.

The basic functionality of the module does not require any additional changes. Run the game and press the default key (`KEY_FOR_DISPLAYING_HINTS`, currently is set to `SPACE`) to see the hints.

### Configuration Options

There are several configurable options that can be tweaked in the top of module's `asc` file.

#### MAX_ROOM_HOTSPOSTS_SUPPORTED
The the highest ID of a hotspot in the room. This is required because a 
static allocation for data in this module.
To disable hints on hotspots, set this to 0.

#### MAX_CHARACTERS_SUPPORTED
The the highest ID of a character in the game. This is required because a 
static allocation for data in this module.
To disable hints on charaters, set this to 0.

#### MAX_ROOM_OBJECTS_SUPPORTED
The the highest ID of an object. This is required because a 
static allocation for data in this module.
To disable hints on objects, set this to 0.

#### TOTAL_HINTS_SUPPORTED
**IMPORTANT:** This value should always be the sum of 
`MAX_ROOM_HOTSPOSTS_SUPPORTED`, `MAX_ROOM_OBJECTS_SUPPORTED` and `MAX_CHARACTERS_SUPPORTED`. <br>
If this condition is not met, the module will crash the game on startup to prevent array out of 
bounds access.

#### HINT_SHAPE_TO_USE
Which shape to use for hints. Can be `eHintCircle`, `eHintRectangle` or `eHintMixed`.
When `eHintMixed` is selected, each shape is determined individually with the help of `HINT_SHAPE_MIXED_RATIO`.

#### HINT_SHAPE_MIXED_RATIO
If `HINT_SHAPE_TO_USE` is set to `eHintMixed`, this will be the ratio used for deciding
which shape to use.
If the width/height or height/width of the area is larger than this
defined value, then a rectangle will be used, otherwise, a circle. 

#### BORDER_WIDTH
The thickness of the highlight shape.

#### PADDING
Padding to add around objects/hotspots/characters in pixels.

#### BORDER_COLOR
The color of the highlight shape. <br>
The default is `Game.GetColorFromRGB(Random(255), Random(255), Random(255))` which randimizes the color of each highlight.

#### MINIMAL_SHAPE_SIZE
To prevent highlights that are too small, it is possible to define minimal
size. If the shape is smaller that that size, it's size will be increased.
For circles, size represents the diameter of the circle in pixels.
For rectangles, each of the edges will be increased seperatly and size represnts the length of the edges in pixels.

#### USE_CUSTOM_HANDLING
If this parameter set to `true`, the user of the module is responsible for
calling the module's interface functions for calculating and displaying hints.

#### KEY_FOR_DISPLAYING_HINTS
Which key is bound to overlay displaying.
Used only when USE_CUSTOM_HANDLING is set to `false`.
