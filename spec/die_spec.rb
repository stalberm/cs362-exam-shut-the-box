require_relative '../lib/die'

describe 'A die' do

  describe 'attributes' do
    it 'has a number of sides' do
      die = Die.new
      expect(die).to respond_to(:number_of_sides)
    end

    it 'TODO' do
      skip
    end
  end

  describe 'number of sides' do
    it 'has six sides by default' do
      skip
    end

    it 'can be created with a custom number of sides' do
      skip
    end
  end

  describe 'face value' do
    it 'has a face value of 1 by default' do
      skip
    end
  end

  describe '#to_s string representation' do
    it 'TODO' do
      skip
    end
  end

  describe 'rolling' do
    # Don't spend time testing #roll or #random_face_value. Move on.
  end

end
