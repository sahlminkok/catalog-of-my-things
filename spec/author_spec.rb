require_relative '../author'

describe Author do
  let(:author) { Author.new('John', 'Doe') }

  describe 'Initialization' do
    it 'should have an ID, first name, and last name' do
      expect(author.id).to be_a(Integer)
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end
  end
end
