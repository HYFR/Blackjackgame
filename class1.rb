class Table
attr_reader :player, :dealer

def initialize()
  @player = []
  @dealer = []
end

def dealer_hand()
	first_hit_dealer()
	if dealer_score < dealer_cap
		while dealer_score() < dealer_cap()
			deal_to_dealer
		end
	end
end

# Number
# Holds the value of 18
# max is used to determine when dealer is going to stop
def dealer_cap()
	max = 18
	return max
end

# Number
# Holds the value of 21
# max is used to determine when dealer is going to stop
def cap()
  max = 21
  return max
end

# Number
# Pushes a random number into the player array.
# used when player clicks on 'hit' within the interface

def deal_to_player()
  card = rand(1..10)
  puts "You have been dealt a card with a value of #{card}"
  player << card
end

# Number
# Pushes a random number into the dealer array.
# used automatically when it is the dealer's turn.
def deal_to_dealer()
  card = rand(1..10)
  puts "You have been dealt a card with a value of #{card}"
  dealer << card
end

# Number
# sums all the numbers in the player array and adds it into total.
# The score is taken in the GameWindow class and drawn on the top left of the screen.
def player_score()
  total = 0
  player.each do |count|
    total += count
  end
  total
end

# Number
# sums all the numbers in the dealer array and adds it into total.
# The score is taken in the GameWindow class and drawn on the top right hand of the screen.

def dealer_score()
  total = 0
  dealer.each do |count|
    total += count
  end
  #puts "Dealer score is #{total}"
  total
end

# String
# a string is printed out with the player's score.
# This method is used for the purpose of making sure the game runs.
def print_player_score()
  puts "Your score is #{player_score}"
  player_score
end

# Number
# Two numbers are generated at random and pushed into the dealer hash
# first_hit_dealer() is used Game_Ctrlr class to run the blackjack game.

def first_hit_dealer()
  first_card = rand(1..10)
  second_card = rand(1..10)
  total = first_card + second_card
  puts "Your first two cards have a sum of #{total}"
  dealer << first_card
  dealer << second_card
  #return total
end

# Number
# Two numbers are generated at random and pushed into the dealer hash
# first_hit_dealer() is used Game_Ctrlr class to run the blackjack game.

def first_hit()
  first_card = rand(1..10)
  second_card = rand(1..10)
  total = first_card + second_card
  puts "Your first two cards have a sum of #{total}"
  player << first_card
  player << second_card
  return total
end

# Number
# the dealer's score is compared to its cap, 18, and determines whether or not he lost. If he did, the player wins and a message is displayed.

def dealer_bust()
	if dealer_score < dealer_cap || dealer_score > dealer_cap
		puts "Player wins!"
		return player_score
	else
		puts "Dealer wins!"
		return dealer_score
	end
end

# text
# the player's score is compared to the 21-cap and depending on that conditional, "dealer won" is printed.

def bust()
  if player_score > cap
	puts "Dealer won"
  end
end
end


class Game_Ctrlr
	# holds an instance of table
	def initialize(table)
		@table = table
	end

	# holds an instance of first hit
	def first_hit
		@table.first_hit
	end

# runs my game
	
	def game()
		@table.first_hit()
		@table.print_player_score()
		while @table.player_score() <= @table.cap
			choice = @table.prompt
			if choice == "hit"
				@table.deal_to_player(@table.player)
			elsif choice == "stay"
				@table.dealer_hand()
				@table.dealer_bust
				break
			else
				puts "Type 'hit' or 'stay'."
			end #if-elseif-else
			@table.print_player_score
		end #while
		@table.bust()
	end #game
end # Game_Ctrlr



class GameWindow < Gosu::Window
	def initialize
		super 653, 300, false
		self.caption = "Blackjack"
		@game = Table.new
		@controller = Game_Ctrlr.new @game
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
		#@background_image = Gosu::Image.new(self, "Blackjack1.jpg", true)
		@controller.first_hit()
		outcome_win_strings
	end
	
	
		# draws a little card in the middle of the screen
	def card_graphics(x)
		draw_quad(295+x, 95, Gosu::Color.argb(0xffffffff), 310+x, 95, Gosu::Color.argb(0xffffffff), 295+x, 120, Gosu::Color.argb(0xffffffff), 310+x, 120, Gosu::Color.argb(0xfffffff))
	end
	
	# allows cursor to be seen on the window
	def needs_cursor?
		true
	end
	
	
	# places a card on the window
	def draw_card
		if @show_card == true
			card_graphics(10)
		end
	end

		#holds the text images
	def outcome_win_strings
		@display_player_win = Gosu::Image.from_text(self, "Player won!", "Times New Roman", 50)
		@display_dealer_win = Gosu::Image.from_text(self, "Dealer won!", "Times New Roman", 50)
		@display_game_tie = Gosu::Image.from_text(self, "There was a tie!", "Times New Roman", 50)
	end
	
	
		# conditional statement that displays the winner's text
	def draw_player_win
		if @show_player_win == true
			@display_player_win.draw(300, 150, 0)
		end
	end		

	# conditional statement that displays dealer's text
	def draw_dealer_win
		if @show_dealer_win == true
			@display_dealer_win.draw(300, 150, 0)
		end
	end
		
	# conditional statements that shows a tie
	def draw_game_tie
		if @show_game_tie == true
			@display_game_tie.draw(300, 150, 0)
		end
	end
	
	# conditionals that determine what text is going to be shown at the end of the game
		
	def game_outcome
		if @game.dealer_score > 21
			@show_player_win = true
		elsif @game.player_score > 21
			@show_dealer_win = true
		elsif @game.dealer_score == @game.player_score
				@show_game_tie = true
		elsif @game.dealer_score > 1 && @game.player_score > 1
			if @game.dealer_score > @game.player_score
				@show_dealer_win = true
			elsif @game.dealer_score < @game.player_score
				@show_player_win = true
			end
		end
	end		
	
	# determines if a button is clicked
	def card_outcome
		if mouse_x < 100 && mouse_y > 250
		end
	end
	
	# conditional statements determined by where the mouse is clicked
	
	def button_down(id)
		case id
		when Gosu::MsRight
			p "right click"
			@pos = [mouse_x,mouse_y]
		when Gosu::MsLeft
			if mouse_x < 100 && mouse_y > 250
				@game.deal_to_player
				@show_card = true
				@game.player_score
			elsif mouse_x > 553 && mouse_y > 250
				@game.dealer_hand
				@game.dealer_bust
			end
			p [mouse_x, mouse_y]
		else
			p "Mouse clicks only"
		end
	end

	def update
		game_outcome
		card_outcome
	end
	
	# draws all my buttons, texts, and rectangles onto the screen.

	def draw
		#@background_image.draw(0, 0, 0);
		@font.draw("Player Score: #{@game.player_score}", 10, 10, 1, 1.0, 1.0, 0xffffff00)
		@font.draw("Cards: #{@game.player}", 10, 40, 1, 1.0, 1.0, 0xffffff00)
		@font.draw("Dealer Score: #{@game.dealer_score}", 510, 10, 1, 1.0, 1.0, 0xffffff00)
		@font.draw("Cards: #{@game.dealer}", 510, 40, 1, 1.0, 1.0, 0xffffff00)
		
		draw_quad(0, 300, Gosu::Color.argb(0xff808080), 100, 300, Gosu::Color.argb(0xff808080), 100, 250, Gosu::Color.argb(0xff808080), 0, 250, Gosu::Color.argb(0xff808080), z = 0, mode = :default)
		draw_quad(653, 300, Gosu::Color.argb(0xff808080), 553, 300, Gosu::Color.argb(0xff808080), 553, 250, Gosu::Color.argb(0xff808080), 653, 250, Gosu::Color.argb(0xff808080), z = 0, mode = :default)
		draw_quad(285, 95, Gosu::Color.argb(0xffffffff), 300, 95, Gosu::Color.argb(0xffffffff), 285, 120, Gosu::Color.argb(0xffffffff), 300, 120, Gosu::Color.argb(0xfffffff))
		draw_quad(295, 95, Gosu::Color.argb(0xffffffff), 310, 95, Gosu::Color.argb(0xffffffff), 295, 120, Gosu::Color.argb(0xffffffff), 310, 120, Gosu::Color.argb(0xfffffff))
		@font.draw("Hit", 30, 265, 1, 1.0, 1.0, 0xffff00ff)
		@font.draw("Stay", 583, 265, 1, 1.0, 1.0, 0xffff00ff)
		
		
		draw_player_win
		draw_dealer_win
		draw_game_tie
		draw_card
	end
end