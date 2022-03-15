require_relative 'tile_set'

class Box

  attr_reader :tiles

  def initialize(tiles = TileSet.generate)
    @tiles = tiles
  end

  def tiles_remaining?
    tiles.any?(&:up?)
  end

  def no_tiles_remaining?
    tiles.none?(&:up?)
  end

  def total_value_of_remaining_tiles
    tiles.select(&:up?).reduce(0) { |sum, t| sum += t.value }
  end

  def shut?
    no_tiles_remaining?
  end

  def to_s
    tiles.reduce("") { |result, t| result << t.to_s }
  end

  def flip(tile_values)
    tiles.select { |t| tile_values.include? t.value }.each(&:flip)
  end

end
