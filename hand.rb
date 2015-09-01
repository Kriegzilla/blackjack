class Hand

  attr_accessor :contents, :point_total, :ace_count

  def initialize
    @contents = []
    @point_total = 0
    @ace_count = 0
  end

  def show_hand
  puts "\nYour hand is:"
    contents.each do |card|
      puts card.verbose
    end
  puts "Player score: #{self.hand_value}"
  end

  def was_dealt(hand)
    puts ""
    hand.each do |card|
      puts "Dealer was dealt #{card.verbose}"
    end

  end

  def cpu_hand
    puts "\nDealer\'s hand is:"
      contents.each do |card|
        puts card.verbose
      end
    puts "Dealer score: #{self.hand_value}"
  end

  def count_aces
    @ace_count = 0
    contents.each do |card|
      if card.ace?
        @ace_count +=1
      end
    end
  end

  def hand_value
    count_aces
    @point_total = 0
    contents.each do |card|
      @point_total += card.point_value
    end
    while @point_total > 21 && @ace_count > 0
      @point_total -= 10
      @ace_count -= 1
    end

    return @point_total
  end

  def bust?
    self.hand_value > 21
  end

end
