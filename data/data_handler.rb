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

  def load_books_from_json
    books_data = @data_manager.load_from_json('./data/books.json')
    loaded_books = []
    books_data.each do |book_data|
      loaded_books << Book.new(
        book_data[:publisher],
        book_data[:cover_state],
        book_data[:publish_date],
        archived: book_data[:archived]
      )
    end
    loaded_books
  rescue StandardError => e
    puts "Error loading from JSON: #{e.message}"
    []
  end
end
