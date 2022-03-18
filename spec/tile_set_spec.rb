require_relative '../lib/tile_set'

describe 'A tile set' do

  describe '::generate' do

    it 'returns an array of 9 tiles by default' do
      tiles = TileSet.generate
      expect(tiles.length()).to eq 9
    end

    it 'returns an array of tiles of a specified length' do
      specific_length = 5
      tiles = TileSet.generate(specific_length)
      expect(tiles.length()).to eq specific_length
    end

    it 'returns an array of tiles whose values increase from 1, by 1' do
      tiles = TileSet.generate
      expect(tiles[0].value).to eq 1
      for i in 1..8
        expect(tiles[i].value).to eq 1+tiles[i-1].value
      end
    end

  end

end
