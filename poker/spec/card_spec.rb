require "rspec"
require "card"

describe Card do
  subject (:card) { Card.new(11, :H) }

  describe "#initialize" do
    it "has a value between 1-13" do
      expect(card.value).to eq(11)
    end

    it "has a suit of H,C,S,D" do
      expect(card.suit).to eq(:H)
    end
  end

  describe "Can be compared" do
    let (:card1) { Card.new(6, :S)}
    let (:card2) { Card.new(6, :D)}
    let (:card3) { Card.new(13, :C)}
    let (:card4) { Card.new(13, :H)}
    let (:card5) { Card.new(1, :H)}

    it "> returns true when compared to a card with a lower value" do
      expect(card3 > card1).to be true
    end

    it "== returns true when compared to a card of equal value" do
      expect(card1 == card2).to be true
    end

    it ">= returns true when compared to a card of lower value" do
      expect(card3 >= card2).to be true
    end

    it ">= returns true when compared to a card of equal value" do
      expect(card3 >= card4).to be true
    end

    it "<= returns true when compared to a card of equal or greater value" do
      expect(card5 <= card2).to be true
    end

    it "<= returns true when compared to a card of equal or greater value" do
      expect(card1 <= card2).to be true
    end

    it "< returns true when compared to a card of greater value" do
      expect(card2 < card3).to be true
    end

    it "!= returns true when compared to a card of different value" do
      expect(card2 != card4).to be true
    end

  end
end
