require_relative 'tile'

class TileSet

  def self.generate(quantity = 9)
    (1..quantity).map { |n| Tile.new(n) }
  end

end
