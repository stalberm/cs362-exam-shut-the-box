class Tile

  attr_reader :value

  def initialize(value)
    @value = value
    @up = true
  end

  def up?
    @up
  end

  def flip
    @up = false
  end

  def to_s
    up? ? "[#{value}]" : '[ ]'
  end

end
