Worthy suggestions from Nabila and Marcus
Adding methods to bullet class to make collisions simpler
collideWall() which stops a bullet that hits the edge of the screen
collideAlien() which detects a bullet hitting an alien and damages/kills them
collidePlayer() which detects a bullet hitting the player and damages/kills them
Notes:
Bullets will be one class, their velocity determines if they will hit a player or alien so they can be one class.
Look out if spawning bullets on a game entity causes them to take damage and try to make only the aliens without aliens between them and the player can shoot, largest index of a row/column can only shoot

Unworthy suggestion from Nabila and Marcus
Making an array for aliens
Reason to unworthiness: I already planned aliens to be a 2D array, why did they suggest it again?
