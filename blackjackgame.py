from random import randint
import pygame
from pygame.locals import *

class Table(object):

	player = []
	dealer = []

	def __init__(self, score):
		self.score = score

	def player_cap():
		max = 21
		
	def dealer_cap():
		max = 17
	
	def deal_to_player(player):
		card = random.randint(1, 10)
		print "You have been dealt a card with a value of %r." % card
		player.append(card)
	
	def deal_to_dealer(dealer):
		card = random.randint(1, 10)
		print "You have been dealt a card with a value of %r." % card
		dealer.append(card)
	
	def player_score():
		total = 0
		for number in player:
			total += number
		total
		
	def dealer_score():
		total = 0
		for number in dealer:
			total += number
		total
	
	def first_hit_dealer():
		first_card = random.randint(1, 10)
		second_card = random.randint(1, 10)
		total = first_card + second_card
		dealer.append(first_card)
		dealer.append(second_card)
	
	def first_hit_player():
		first_card = random.randint(1, 10)
		second_card = random.randint(1, 10)
		total = first_card + second_card
		player.append(first_card)
		player.append(second_card)
	
	def dealer_bust():
		if dealer_score < dealer_cap or dealer_score > dealer_cap:
			print "Player wins!"
			return player_score
		else: 
			print "Dealer wins!"
			return dealer_score
		
	def player_bust():
		if player_score > player_cap:
			print "Dealer won!"
			
	
class Game:

	def __init__(self):
		self._running = True
		self._display_surf = None
		
	def on_init(self):
		pygame.init()
		self._running = True
		
	def on_event(self, event):
		if event.type == pygame.QUIT:
			self._running = False
			
	def on_cleanup(self):
		pygame.quit()
		
	def background_image(self):
		#initialise screen
		screen = pygame.display.set_mode((653, 300))
		pygame.display.set_caption("Python Blackjack Game")
		
		#Fill Background
		#background = pygame.Surface(screen.get_size())
		background = pygame.image.load("Blackjack1.jpg")
		
		#Blit everything to the screen
		screen.blit(background, (0, 0))
		pygame.display.flip()	
		
	#def 
	
	def on_execute(self):
		if self.on_init() == False:
			self._running = False

		while(self._running):
			for event in pygame.event.get():
				self.on_event(event)
			self.background_image()
		self.on_cleanup()

	
if __name__ == '__main__':
	myGame = Game()
	myGame.on_execute()