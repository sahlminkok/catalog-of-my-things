require 'json'
require_relative '../music_album'

class DataHandler
  def initialize(data_manager)
    @data_manager = data_manager
  end

  def save_books_to_json(books)
    books_data = books.map(&:to_hash)
    @data_manager.save_to_json('./data/books.json', books_data)
    puts 'Book saved to record successfully'
  rescue StandardError => e
    puts "Error saving to Json: #{e.message}"
    []
  end

  def load_books_from_json
    file_path = './data/books.json'
    if File.exist?(file_path)
      books_data = @data_manager.load_from_json(file_path)
    else
      puts 'The JSON file does not exist. Creating empty file.'
      File.write(file_path, '[]')
      books_data = []
    end
    loaded_books = []
    books_data.each do |book_data|
      loaded_books << Book.new(book_data[:publisher], book_data[:cover_state],
                               book_data[:publish_date], archived: book_data[:archived])
    end
    loaded_books
  rescue StandardError => e
    puts "Error loading from JSON: #{e.message}"
    []
  end

  def save_games_to_json(games)
    games_data = games.map(&:to_hash)
    @data_manager.save_to_json('./data/games.json', games_data)
    puts 'Game saved Successfully'
  rescue StandardError => e
    puts "Error saving to json: #{e.message}"
    []
  end

  def load_games_from_json
    file_path = './data/games.json'
    if File.exist?(file_path)
      games_data = @data_manager.load_from_json(file_path)
    else
      puts 'The JSON file does not exist. Creating an empty file'
      File.write(file_path, '[]')
      games_data = []
    end
    loaded_games = []
    games_data.each do |game_data|
      loaded_games << Game.new(game_data[:multiplayer], game_data[:last_played_at],
                               game_data[:publish_date])
    end
    loaded_games
  rescue StandardError => e
    puts "Error loading from JSON: #{e.message}"
    []
  end

  def save_albums_to_json(albums)
    albums_data = albums.map(&:to_hash)
    @data_manager.save_to_json('./data/albums.json', albums_data)
    puts 'Music Album saved to record successfully'
  rescue StandardError => e
    puts "Error saving to Json: #{e.message}"
    []
  end

  def load_albums_from_json
    file_path = './data/albums.json'
    if File.exist?(file_path)
      albums_data = @data_manager.load_from_json(file_path)
    else
      puts 'The JSON file does not exist. Creating empty file.'
      File.write(file_path, '[]')
      albums_data = []
    end
    loaded_albums = []
    albums_data.each do |album_data|
      loaded_albums << MusicAlbum.new(album_data[:publish_date], archived: album_data[:archived],
                                                                 on_spotify: album_data[:on_spotify])
    end
    loaded_albums
  rescue StandardError => e
    puts "Error loading from JSON: #{e.message}"
    []
  end
end
