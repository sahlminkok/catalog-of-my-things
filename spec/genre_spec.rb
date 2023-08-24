require_relative '../genre'
require_relative '../item'
require 'rspec'

RSpec.describe Genre do
  let(:genre_name) { 'Fantasy' }
  let(:genre) { Genre.new(genre_name) }

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = Item.new('2023-08-22')
      genre.add_item(item)

      expect(genre.instance_variable_get(:@items)).to include(item)
      expect(item.genre).to eq(genre)
    end

    it 'associates the genre with the item' do
      item = Item.new('2023-08-22')
      genre.add_item(item)

      expect(item.genre).to eq(genre)
    end
  end
end

