/** 
 * @author  Artium Nihamkin, artium@nihamkin.com
 * @date    09/2018
 * @version 2.2.0
 *  
 * @brief This is an AGS module that makes it possible to add a hinting
 *        system to a game. Upon user action, a shape will be drawn
 *        around each enabled hotspot in the room.
 *  
 * @section LICENSE
 *
 * The MIT License (MIT)
 * Copyright © 2018 Artium Nihamkin, artium@nihamkin.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the “Software”), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * @section DESCRIPTION 
 *
 * This module adds a hinting system to your game. Hints are circles or rectangles
 * which highlight hotspots in the game. Players which are stuck and wish to skip the
 * "pixel hunting" stage of a game, can press a button to display an overlay layer with
 * all clickable hotspots highlighted by a shape.
 * 
 * The most basic way to integrate this module into you game is to add the script files.
 * 
 * The default implementation displays the layer as long as the "H" key is help down. 
 * 
 * The user of this module can also provide it's own implementation of when and how to
 * activate the layer with the hints. This is configurable through the USE_CUSTOM_HANDLING
 * parameter. After setting USE_CUSTOM_HANDLING to true, the user must call CalculateHintsForRoom
 * and DisplayHints/HideHints on it's own.
 *
 * Additionally, DisableHints/EnableHints to control when it is applicable to show the layer. 
 * For example, upon entering the menu, a user can call DisableHints and upon returning to 
 * the game, EnableHints can be called.
 *
 * Please see the asc file for more configuration options.
 *
 */


struct HintsHighlighter {
  
  /**
   * Helper function for CalculateHintsForRoom
   */
  import static function UpdateHintWithNewPoint(int ID,  int x,  int y);
  
  /**
    * This function will recalculate the overlay that contains all the hints.
    * Do not run it every frame, it will cripple game's frame rate.
    */
	import static function CalculateHintsForRoom();
  
  /**
   * Display the overlay that contains the hints.
   */
  import static function DisplayHints();
  
  /**
   * Hide the overlay that contains the hints.
   */
  import static function HideHints();
  
  /**
   * Enable the displaying of the hints.
   */
  import static function EnableHints();
  
  /**
   * Disable the displaying of the hints. Calling DisplayHints will
   * do nothing.
   */
  import static function DisableHints();
  
};