require '../book'
require 'rspec'

RSpec.describe Book do
  # Test the initialization of a Book object
  describe "#initialize" do
    it "creates a new Book object with the correct attributes" do
      book = Book.new("Publisher Name", "good", "2023-08-22")
      expect(book.publisher).to eq("Publisher Name")
      expect(book.cover_state).to eq("good")
      expect(book.publish_date).to eq("2023-08-22")
      expect(book.archived).to be_falsey
    end
  end
end
