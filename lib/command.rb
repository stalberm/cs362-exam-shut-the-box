class Command

  GIVE_UP = 'g'

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def valid?(tile_values, dice_total)
    give_up? || (digit_set? && possible_for?(tile_values, dice_total))
  end

  def give_up?
    text == GIVE_UP
  end

  def possible_for?(tile_values, dice_total)
    sum == dice_total && (to_tile_values - tile_values).empty?
  end

  def digit_set?
    /^\d \d \d|\d \d|\d$/.match(text)
  end

  def to_tile_values
    text.split(' ').map(&:to_i)
  end

  def sum
    to_tile_values.sum
  end

  def to_s
    text
  end

end
