require_relative 'all_paths'

class App
  def initialize
    data_manager = DataManager.new
    @data_handler = DataHandler.new(data_manager)
    @books = @data_handler.load_books_from_json
    @labels = []
    @albums = []
    @genres = []
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      puts "\n List of Books"
      @books.each_with_index do |book, index|
        puts "#{index}. Publisher: \"#{book.publisher}\", Cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    return unless @labels.empty?

    puts 'No Labels available'
    @labels.each_with_index do |label, index|
      puts "#{index} id: #{label.id} title: \"#{label.title}\" color: #{label.color}"
    end
  end

  def add_book
    print 'Enter publisher name: '
    name = gets.chomp

    print 'Enter cover status: [good or bad]: '
    cover_status = gets.chomp

    print 'Enter date of publishing [yyyy-mm-dd]: '
    publish_date = gets.chomp

    book = Book.new(name, cover_status, publish_date)
    @books << book

    puts "Book created Successfully! (id: #{book.id})"
    @data_handler.save_books_to_json(@books)
  end

  def list_music_albums
    puts 'No music albums available' if @albums.empty?
    puts ' '
    @albums.each_with_index do |album, index|
      puts "#{index + 1}. Publish Date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
    end
    puts ' '
  end

  def exit_app
    puts 'Thank you for using this App.'
    exit
  end
end
