class PlayingCard

  attr_reader :suit, :rank, :point_value

  def initialize (suit, rank, point_value)
    @suit = suit
    @rank = rank
    @point_value = point_value
  end

  def verbose
    "#{rank} #{suit}"
  end

  def ace?
    @rank == "A"
  end

end
