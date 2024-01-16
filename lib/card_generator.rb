require './lib/card'

class CardGenerator
  attr_reader :lines

  def initialize(file)
    @lines = File.open(file).map { |line| line.chomp }
  end

  def cards
    lines.map do |line|
      value = line.split(", ")[0]
      suit = line.split(", ")[1].downcase.to_sym
      rank = line.split(", ")[2].to_i
      
      Card.new(suit, value, rank)
    end
  end
end
