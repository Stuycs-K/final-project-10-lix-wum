# Work Log

## Sam Li

### 5/22/23

Worked on Background grid visual, created Background class as well as the game background.

### 5/23/23

Added Background class methods, finished clear and isRowCleared methods, and started working on other Tetris class setup/draw methods.

### 5/24/23

Finished Next method, created queue that displays upcoming blocks.

### 5/25/23

Created score and level calculator and display depending on how many lines are cleared with each block. Also created a rounding method for calculating score (this took much longer than it should have). Also created boxes to contain the next and held pieces.

### 5/26/23

Added timer to game as well as increasing gravity depending on the level, as well as finalizing score.

### 5/30/23

Created sound class, spent most of class looking at sound documentation on processing.

### 5/31/23

Imported sound effect files, created sfx class to organize sound effect methods for background sound, soft and hard drop, line clears, and rotates.

### 6/2/23

Created a start screen by importing a tetris logo as well as creating a start button, also created a pause screen that uses a key command (instructions on the game screen - "P to pause"). Moved the creation of hold box and next box to separate methods away from draw in order to be used to redraw the boxes after unpausing. Moved background music to the main Tetris class in order to pause music when the game is paused and replay upon unpausing. Attempted 7bag next piece sorting algorithm but was unable to finish, will continue later. Also created demo branch to present in class. **AFTER CLASS:** fixed 7bag algorithm.

### 6/7/23

Created a menu as well as buttons to play standard and elemental tetris, oragnized code into tabs to reduce clutter, added a settings menu with customizable keybinds (much more work than expected)

### 6/8/23

Added a volume "slider" to settings - volume bar controlled by buttons one each side.

### 6/11/23

Added a play again button, created a loading screen for the game using multithreading in order to display somethign on the screen while assets are being loaded in (you told me this wasn't worth the time Mr. K and it wasn't but I learned a lot :D)

### 6/12/23

Worked on elemental reactions, added sound, created elemental reaction methods and score calculators, optimized menu visuals, fixed menu and elemental reaction bugs. Also added a display for reactions when they react, allowing the player to identify the reaction they just created.

=======================================================================================================================================

## Max Wu

### 5/22/23

Worked on the block class a bit and added the instance variables - blocks 3D array and made 2 blocks (T and I).

### 5/23/23

Finished the declaration of 3D array in Block class, merged with the main in order to work on the implementation of the blocks into the game.
Added several new instance variables into block and began working on the movement of the pieces.

### 5/24/23

AT HOME (BEFORE SCHOOL):
Reworked the Block method in order to make moving blocks easier, changed values of the Background grid in order to make the coordinates not reversed.
Also added keyboard input and movement/rotation of blocks, though need to add fastDrop() method and addition into grid.
IN CLASS: 
added collision checker and deleted old rotation methods (opting to use super rotation system from tetris wiki)
AT DOJO: 
fixed background grid and made size larger in order to make testing rotations easier, also fixed dropping pieces
AT HOME (AFTER SCHOOL): 
finished rotation based on wiki and got clear method working as well as a timer to drop the pieces slowly.
Still need to add actual timer as well as score keeping. also need to add hold functionality.

### 5/25/23

Attempted to make hold function work but kept messing up the next blocks display on right side

### 5/26/23

Fixed rotation errors causeed by line piece rotating on the edge of the grid, also increased grid size to allow for more wall kicks of L and J pieces as well as t-spins (I'm not good enough to do them so we need someone else to test). 

### 5/30/23

Fixed hold functionality, swapping blocks actually works

### 5/31/23

Changed the next blocks from a deque to an arraylist, which allows the next display to correctly display when using hold at the same time

### 6/1/23

Made it so that it is no longer possible to spam the hold button to infinitely stall out the game, also added a ghost block that shows where a piece will land once dropped.

### 6/5/23

Edited code for dropping pieces based on a timer and changed the system to allow for the down key to be held down without the piece being placed instantly. This allows for more precise actions such as t-spins.

### 6/10/23

added elemental game and element type variable to blocks, as well as elemental piece generation and display, the elemental game type is now playable.

### 6/11/23

fixed elemental display for next pieces and hold, fixed bugs with invisible blocks, and added contact detection for blocks.

### 6/12/23

added elemental reactions for block class, further fixed the touching method and made a center variable to track where the center of each block is (to make reactions happen at specific locations). Fixed bugs with invisible blocks appearing after playing the normal game, and added functioning elemental reactions as well as images and sound to accompany reactions. Megumin for Fire + Lightning and Aqua for Water + Wind. Fixed some UI issues with centering, and added button to switch piece-by-piece elemental reactions on and off. Also added more elemental reactions such as lava and shuffle.

# Working Features

- Standard Tetris
- Piece rotation, wall kicks based on the super rotation system
- Piece randomization and generation (7bag algorithm)
- Ghost block showing where a piece will land once dropped (quality of life optimization)
- Piece hold function
- Row clearing
- Scoring system
- Level system based on lines cleared, increasing gravity/difficulty
- Death screen with final score
- Pause menu that can access configurations and exit to main menu
- Configurations menu allowing for keybind, volume, and reaction changes
- Elemental Tetris
- All elemental reactions are functional and with working piece generation/display based on elements

# Bugs/incomplete features

- When going into a new game after playing either normal tetris or elemental tetris and losing, the held piece will be kept and carry over into the new game
- After a minute or two, the sound completely breaks and glitches out, removing them from cache and stopping all sounds are unable to prevent this bug (likely a issue with program cpu/memory usage)
- Elemental reactions do not all have images and sounds, although the most important ones do
- Elemental reactions are not balanced, some are very overpowered while others are useless (like aqua)
- No animations for reactions, this would take very long and we did not have the time
