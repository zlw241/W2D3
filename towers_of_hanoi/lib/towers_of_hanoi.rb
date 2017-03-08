class Game
  attr_reader :towers, :size

  def initialize(tower1 = [5,4,3,2,1], tower2 = [], tower3 = [])
    @size = tower1.length
    @towers = [tower1, tower2, tower3]
  end

  def tower1
    towers[0]
  end

  def tower2
    towers[1]
  end

  def tower3
    towers[2]
  end

  def towers_n(n)
    towers[n-1]
  end

  def move(from_tower, to_tower)
    unless towers_n(to_tower).empty? || (towers_n(from_tower)[-1] < towers_n(to_tower)[-1])
      raise "Disc error"
    else
      towers_n(to_tower) << towers_n(from_tower).pop
    end
  end

  def won?
    tower2.length == size || tower3.length == size
  end

  def play
    until won?
      system("clear")
      render
      puts "Pick a tower to move from and to (from, to)"
      from_tower, to_tower = gets.chomp.split(",").map(&:to_i)

      move(from_tower, to_tower)
    end

    render
    puts "You win!"
  end

  def render
    towers.each { |tower| puts tower.join(" ") }
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
