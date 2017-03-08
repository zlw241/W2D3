require_relative "card"

class Deck
  attr_accessor :cards, :trash

  def initialize
    @cards = []
    @trash = []
    populate_deck
  end

  def populate_deck
    (1..13).each do |v|
      Card::SUITS.each do |suit|
        cards << Card.new(v, suit)
      end
    end
  end

  def shuffle
    cards.shuffle!
    cards
  end

  def card_ids
    cards.map { |card| card.unique_id }
  end

  def draw
    card = cards.shift
    trash << card
    card
  end

  def burn
    trash << cards.shift
  end

end
