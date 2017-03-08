

class Card
  attr_reader :value, :suit, :unique_id

  SUITS = [:C, :H, :D, :S]

  def initialize(value, suit)
    @value = value
    @suit = suit
    @unique_id = "#{value}#{suit}"
  end

  def ==(other_card)
    value == other_card.value
  end

  def !=(other_card)
    value != other_card.value
  end

  def >=(other_card)
    value >= other_card.value
  end

  def <=(other_card)
    value <= other_card.value
  end

  def <(other_card)
    value < other_card.value
  end

  def >(other_card)
    value > other_card.value
  end

  def <=>(other_card)
    value <=> other_card.value
  end

  def exact_same?(other_card)
    value == other_card.value && suit == other_card.suit
  end

end
