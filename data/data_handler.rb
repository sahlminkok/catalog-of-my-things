require 'json'

class DataHandler
  def initialize(data_manager)
    @data_manager = data_manager
  end

  def save_books_to_json(books)
    books_data = books.map(&:to_hash)
    @data_manager.save_to_json('./data/books.json', books_data)
    puts 'Book saved to record successfully'
  rescue StandardError => e
    puts "Error saving file to JSON: #{e.message}"
  end
end
