require '../book'
require 'rspec'

RSpec.describe Book do
  # Test the initialization of a Book object
  describe '#initialize' do
    it 'creates a new Book object with the correct attributes' do
      book = Book.new('Publisher Name', 'good', '2023-08-22')
      expect(book.publisher).to eq('Publisher Name')
      expect(book.cover_state).to eq('good')
      expect(book.publish_date).to eq('2023-08-22')
      expect(book.archived).to be_falsey
    end
    it 'creates a new Book object with archived state' do
      book = Book.new('Publisher Name', 'bad', '2023-08-22', archived: true)
      expect(book.archived).to be_truthy
    end
  end
  describe '#to_hash' do
    it 'returns a hash with the correct attributes' do
      book = Book.new('Publisher Name', 'good', '2023-08-22')
      hash = book.to_hash
      expect(hash[:publisher]).to eq('Publisher Name')
      expect(hash[:cover_state]).to eq('good')
      expect(hash[:publish_date]).to eq('2023-08-22')
      expect(hash[:archived]).to be_falsey
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when cover_state is "bad"' do
      book = Book.new('Publisher Name', 'bad', '2023-08-22')
      expect(book.can_be_archived?).to be_truthy
    end

    it 'returns false when cover_state is "good"' do
      book = Book.new('Publisher Name', 'good', '2023-08-22')
      expect(book.can_be_archived?).to be_falsey
    end
  end
end
