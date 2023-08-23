require_relative 'all_paths'
require_relative 'music_album'

class App
  def initialize
    data_manager = DataManager.new
    @data_handler = DataHandler.new(data_manager)
    @books = @data_handler.load_books_from_json
    @labels = []
    @albums = []
    @genres = []
    @games = []
    @authors = []
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

  def list_all_genres
    puts 'No genres available' if @genres.empty?
    puts ' '
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. Name: #{genre.name}, ID: #{genre.id}"
    end
  end

  def add_album
    print 'Enter publish date [yyyy-mm-dd]: '
    publish_date = gets.chomp

    print 'Is it on spotify? [y/n]: '
    on_spotify = gets.chomp.downcase

    album = MusicAlbum.new(publish_date, on_spotify: (on_spotify == 'y'))
    @albums << album

    puts "Music Album created successfully, id: #{album.id}"
    puts ' '
  end

  def list_all_games
    puts 'No games available' if @games.empty?
    puts ' '
    @games.each_with_index do |game, index|
      puts "#{index + 1}. Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at}"
    end
    puts ' '
  end

  def list_all_authors
    puts 'No authors available' if @authors.empty?
    puts ' '
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
    puts ' '
  end

  def add_game
    print 'Multiplayer [yes/no]: '
    multiplayer = gets.chomp.downcase

    print 'Last Played At [yyyy-mm-dd]: '
    last_played_at = gets.chomp

    print 'Publish Date [yyyy-mm-dd]: '
    publish_date = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game

    puts "Game created successfully: #{game.id}"
  end

  def exit_app
    puts 'Thank you for using this App.'
    exit
  end
end
