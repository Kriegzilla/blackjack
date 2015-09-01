#!/usr/bin/env ruby

# YOUR CODE HERE
require 'pry'
require_relative "deck"
require_relative "hand"
require_relative "playingcard"

blackjack_deck = Deck.new
player_hand = Hand.new
dealer_hand = Hand.new

blackjack_deck.populate_deck
blackjack_deck.shuffle_deck
blackjack_deck.initial_deal(player_hand.contents, dealer_hand.contents)
player_hand.show_hand
blackjack_deck.hit_prompt(player_hand)
#player's turn ends here
sleep(1)
dealer_hand.was_dealt(dealer_hand.contents)
blackjack_deck.dealer_hit(dealer_hand)
sleep(1)
puts "\nCalculating winner..."
sleep(1)
blackjack_deck.score_compare(player_hand.hand_value, dealer_hand.hand_value)
