require 'gosu'
require 'test/unit'
require_relative './class1.rb'

class TestGame < Test::Unit::TestCase
	def test_game_
		table = Table.new()
		game  = Game_Ctrlr.new(table)
		
		player_cap = table.cap()
		assert_equal(player_cap, 21)
		
		player_score = table.player_score()
		dealer_score = table.dealer_score()
		print_player_score = table.print_player_score()
		
		assert_equal(player_score, 0)
		assert_equal(dealer_score, 0)
		assert_equal(print_player_score, 0)
		
		dealer_bust = table.dealer_bust()
		deal_to_player = table.deal_to_player()
		deal_to_dealer = table.deal_to_dealer()
		bust = table.bust()
		
		assert_equal(true, deal_to_player[0] >= 1 && deal_to_player[0] <= 10)
		assert_equal(0, dealer_bust)
		assert_equal(true, deal_to_dealer[0] >= 1 && deal_to_dealer[0] <= 10)
	
	end
end
	