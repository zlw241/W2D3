require "card"
require "deck"
require "rspec"

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a deck with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "all elements of cards attribute are of class Card" do
      expect(deck.cards.all? { |c| c.is_a?(Card) }).to be true
    end

    it "all cards in the deck are unique" do
      deck_hash = Hash.new { |h, k| h[k] = [] }

      deck.cards.each do |card|
        deck_hash[card.value] << card.suit
      end

      expect(deck_hash.values.all? { |suits| suits.length == 4 }).to be true
    end
  end

  describe "#shuffle" do
    let (:original_ids) { deck.card_ids.dup }

    it "shuffled deck will contain same cards as original" do
      deck.shuffle
      expect(deck.card_ids.sort).to eq(original_ids.sort)
    end

    it "shuffled deck will modify the order of the original deck" do
      original_ids = deck.card_ids.map { |c| c.dup }.dup
      deck.shuffle
      expect(deck.card_ids).not_to eq(original_ids)
    end

  end
end
