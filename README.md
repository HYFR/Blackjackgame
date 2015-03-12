# Blackjack game using Ruby
This is a Black Jack game built using Ruby
This game is fairly simple.
You will notice that two cards are displayed in the middle of the screen, a number on the 
top left side of the screen and two buttons on either side of the lower half of the screen. Depending
on the score, the player, you, will have the ability to continue by clicking on the 'hit' button
or try your luck against the randomizer that is the dealer when you click the 'stay' button.

Prerequisites  to run my code:
- Have Ruby installed
- Run on powershell

How to run my code:
	The libgosu window will pop up. There are a few things that you will notice when my gun is running.
There are two essential buttons at the bottom of both sides of the screen, the 'hit' button and
the 'stay' button. In addition, you will notice the player's score and cards on the top left
side of the screen and the dealer's score and cards at the top right of the screen. 

The game automatically gives the player two cards and adds their points into the 'Score' section.
The player, you, then has the ability to continue acquiring points or stay and try your luck
against the dealer's score.

This game is replicating 21 or Blackjack. The objective is for you, the player, to get as close to
the score of 21 as possible. If you breach 21-points, you automatically lose. When you stay, the dealer
then has to hit 21 or achieve a score higher than yours but not more than 21.

Aspects of my game that do and don't work in my implementation:
Do's:
- First Hit: The game automatically gives the player and dealer two cards on their first turn.
- Win: Text is displayed to distinguish who won.
- Card Graphic: Two basic card graphics have been implemented.
- Text: Text has been added to the game, such as player and dealer score and cards.
- Buttons: Two click-able buttons have been added to be able to play the game.

Don't's:
- Card Graphics: Only three cards can be added into the game, and the dealer doesn't have any
graphic cards available at this time.
- Restart Button: No restart button has been added at this time.
- Exit button: No key button has been programmed to exit the game at this time. You have to
manually exit through the red 'x' at the top right of the screen.

---- No images were used in the making of my game ----
* The card graphics you see on the screen were made using libgosu's image class.