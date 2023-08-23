require '../label'

describe Label do
  describe '#initialize' do
    it 'creates a new label with a title and color' do
      label = Label.new('My Label', 'red')
      expect(label.title).to eq('My Label')
      expect(label.color).to eq('red')
    end

    it 'generates a random ID if ID is not provided' do
      label = Label.new('Another Label', 'blue')
      expect(label.id).to be_a(Integer)
    end

    it 'uses the provided ID if one is given' do
      label = Label.new('Custom ID Label', 'green', 123)
      expect(label.id).to eq(123)
    end
  end
end
