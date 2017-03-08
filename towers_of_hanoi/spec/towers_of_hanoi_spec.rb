require "rspec"
require "towers_of_hanoi"

describe Game do
  subject (:game) { Game.new }

  describe "#initialize" do
    it "initializes tower1 to an Array" do
      expect(game.tower1.is_a? Array).to be true
    end

    it "initializes tower2 to an Array" do
      expect(game.tower2.is_a? Array).to be true
    end

    it "initializes tower3 to an Array" do
      expect(game.tower3.is_a? Array).to be true
    end

    it "places discs in tower 1" do
      expect(game.tower1).to eq([5,4,3,2,1])
    end
  end

  describe "#move" do
    context "valid move" do
      before(:each) { game.move(1, 2) }

      it "pops a disc off the start tower" do
        expect(game.tower1).to eq([5,4,3,2])
      end

      it "adds a disc to the to tower" do
        expect(game.tower2).to eq([1])
      end

    end

    context "invalid move" do
      before(:each) { game.move(1, 2) }

      it "won't place a disc on top of smaller disc" do
        expect { game.move(1, 2) }.to raise_error("Disc error")
      end
    end
  end

  describe "#won?" do
    let (:won_game) { Game.new([], [5,4,3,2,1], []) }
    it "detects that the game has been won" do
      expect(won_game.won?).to be true
    end

    it "detects that a game is not yet won" do
      expect(game.won?).to be false
    end
  end
end
