[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Mfyqb_T6)
# NeXtCS Project 01
### thinker0: Blir Nura
### thinker1: FRIST LSAT
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga

This project will be completed in phases.  
The first phase will be to work on this document. 
* Use markdown formatting.
* For more markdown help
  - [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or
  - [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Space Invaders

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.

A group of enemies that move sideways then down while occasionally shooting towards the player
A player-controlled spaceship capable of moving sideways and shooting on user commmand
Projectiles that can destroy enemies and the player

One of the following:
Multiple lives for the player
Play/pause button
Reset button
Some continuation of the game like a next level after clearing all enemies
Different enemies with different movements, health, speed or etc

### Extra Features
What are some features that are not essential to the program, but you would like to see (provided you have time after completing the necessary features. Theses can be customizations that are not part of the core requirements.

Including more of the extra
Alternative player attacks
The red bonus spaceship that somethings comes
Barriers
Score
Boss enemy

### Array Usage
How will you be using arrays in this project?

1D Array:
- Bullets

2D Array:
- Aliens


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:

Must have controls:
Left and Right arrows for moving spaceship
Spacebar to shoot
P to pause and unpause and/or R to reset the game

Extra controls:
Button to move to the next level
Buttons to switch attack type if adding multiple player attacks

Mouse Control:
- Mouse movement:
- Mouse pressed:


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

Player
- Instance variables:
  - float x, float speed
  - int lives (if multiple lives)
- METHODS
  - display() to draw the player
  - move() for the player to move left and right
  - shoot() to make a bullet shoot from the player
  - takeDamage() to lose a live (if multiple lives)
  - reset() puts player in starting location and possibly gives back lives (if multiple levels)

Bullet
- Instance variables:
  - float x, float y, float speed
- METHODS
  - display() to draw the bullet
  - update() changes the bullet's location based on it's speed and if it hit something
  - collide() if the bullet hits an alien or the edge of the screen

Alien
- Instance variables:
  - float x, float y, float speed
  - int lives (if multiple lives)
- METHODS
  - display() to draw the aliens
  - update(float dx, float dy) to move the alien group
  - life() to kill the alien if it is shoot
  - shoot() to have random aliens shoot at the player
  - takeDamage() to lose a live (if multiple lives)
