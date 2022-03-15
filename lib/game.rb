require_relative 'box'
require_relative 'die'
require_relative 'command'

class Game

  WELCOME_MESSAGE = "Welcome to Shut the Box. Minimize your score. Let's play."
  WINNING_MESSAGE = "Congratulations! You shut the box."
  TURN_INSTRUCTIONS = "Enter the tiles to flip separated by a space or 'g' to give up"

  attr_reader :box, :dice

  def initialize(box = Box.new, dice = [Die.new, Die.new])
    @box = box
    @dice = dice
    @conceded = false
  end

  def play
    puts WELCOME_MESSAGE
    play_turn until over?
    puts result
  end

  def play_turn
    puts box_status
    roll_dice
    puts dice_status
    begin
      puts TURN_INSTRUCTIONS
      command = Command.new(gets.chomp)
    end while not (command.valid?(remaining_tile_values, dice_total))
    if command.give_up?
      concede!
    else
      box.flip(command.to_tile_values)
    end
  end

  def remaining_tile_values
    box.tiles.select(&:up?).map(&:value)
  end

  def conceded?
    @conceded
  end

  def concede!
    @conceded = true
  end

  def over?
    conceded? || !box.tiles_remaining?
  end

  def box_shut?
    box.shut?
  end

  def score
    box.total_value_of_remaining_tiles
  end

  def result
    box_shut? ? WINNING_MESSAGE : "Game over. Score: #{score}."
  end

  def box_status
    box.to_s
  end

  def dice_status
    "Dice: #{dice.collect(&:to_s).join(' ')}"
  end

  def dice_total
    dice.sum(&:face_value)
  end

  def roll_dice
    dice.each { |d| d.roll }
  end

end
