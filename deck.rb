class Deck

  attr_accessor :deck, :shuffled_deck
  attr_reader :suits, :ranks, :point_value

  def initialize
    @deck = []
    @suits = ["♠", "♥", "♦", "♣"]
    @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    @point_value = [2,3,4,5,6,7,8,9,10,10,10,10,11]
    @shuffled_deck = []
  end

  def populate_deck
    suits.each do |suit|
      i=0
      ranks.each do |rank|
        deck << PlayingCard.new(suit, rank, point_value[i])
        i +=1
      end
    end
  end

  def shuffle_deck
    self.shuffled_deck = deck.shuffle
  end

  def initial_deal (hand1, hand2)
    card_counter = 0
    until card_counter == 2
      puts "Player was dealt #{shuffled_deck[0].verbose}"
      hand1 << shuffled_deck[0]
      shuffled_deck.delete_at(0)
      sleep(1)
      hand2 << shuffled_deck[0]
      shuffled_deck.delete_at(0)
      card_counter +=1
    end
  end

  def hit_prompt(player_hand)
    print "\nHit or stand (H/S): "
    input = gets.chomp.upcase
    until input == "H" || input == "S"
      puts "Invalid choice, please input h or s"
      input = gets.chomp.upcase
    end
    # puts "Hit or stand (H/S): #{input}"
    if input == 'H'
      hit_me(player_hand)
      player_hand.show_hand
      bust_check(player_hand)
    else
      puts "\nPlayer stands."
      sleep(1)
      # player_hand.show_hand
    end
  end

  def bust_check(player_hand)
    if player_hand.bust?
      abort("You went over 21 points and busted. \nYou lost all your money :(")
    else
      hit_prompt(player_hand)
    end
  end

  def hit_me(hand)
    puts "\nActive player was dealt #{shuffled_deck[0].verbose}\n"
    hand.contents << shuffled_deck[0]
    shuffled_deck.delete_at(0)
    sleep(1)
  end

  def dealer_hit(hand)
    if hand.hand_value < 17
      hit_me(hand)
      sleep(1)
      if hand.bust?
        abort("Dealer bust! You win!")
      end
      dealer_hit(hand)
    else
      puts "\nDealer stands"
      hand.cpu_hand
    end
  end

  def score_compare(hand_value1, hand_value2)
    puts "\nPlayer score: #{hand_value1}"
    puts "Dealer score: #{hand_value2}"
    if hand_value1 > hand_value2
      puts "Player wins!"
    elsif hand_value1 < hand_value2
      puts "Dealer wins!"
    else
      puts "Tie! All the money wagered is burned."
    end
  end

end
