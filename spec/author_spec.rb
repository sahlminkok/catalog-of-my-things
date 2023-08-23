require_relative '../author'
require_relative '../item'

describe Author do
  let(:author) { Author.new('John', 'Doe') }

  describe 'Initialization' do
    it 'should have an ID, first name, and last name' do
      expect(author.id).to be_a(Integer)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end

  describe 'Adding Items' do
    let(:item1) { Item.new('2023-08-22') }
    let(:item2) { Item.new('2023-08-22') }

    it 'should associate items with the author' do
      author.add_item(item1)
      author.add_item(item2)

      expect(item1.authors).to include(author)
      expect(item2.authors).to include(author)
    end
  end
end
