require_relative '../genre'

RSpec.describe Genre do
  let(:genre_name) { 'Fantasy' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'creates a new genre with a name' do
      expect(genre.name).to eq(genre_name)
    end

    it 'generates a random ID if not provided' do
      expect(genre.id).to be_a(Integer)
    end

    it 'uses provided ID if given' do
      custom_id = 42
      custom_genre = Genre.new(genre_name, id: custom_id)
      expect(custom_genre.id).to eq(custom_id)
    end
  end
end
