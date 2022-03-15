class Die

  attr_reader :number_of_sides, :face_value

  def initialize(number_of_sides = 6)
    @number_of_sides = number_of_sides
    @face_value = 1
  end

  def roll
    @face_value = random_face_value
  end

  def random_face_value
    rand(number_of_sides) + 1
  end

  def to_s
    face_value.to_s
  end

end
