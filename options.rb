require 'all_paths'

class Options
  def initialize(app)
    @app = app
  end

  def display
    puts 'Welcome to your category of things'
    loop do
      display_options
      option = gets.chomp.to_i
      handle_option(option)
      break if option == 10
    end
  end
  
  private

  def display_options
    puts 'PLease Select an option'
    puts 'Books Section'
    puts ' '
    puts '[1] List all Books'
    puts '[2] List all Labels'
    puts '[3] Add a Book'
    puts ' '
    puts 'Music Section'
    puts '[4] List all music Albums'
    puts '[5] List all Genres'
    puts '[6] Add a music Album'
    puts ' '
    puts ' Games Section'
    puts '[7] List all games'
    puts '[8] List all authors'
    puts '[9] Add a game'
    puts ' '
    puts '[10] Exit'
  end
  
  def handle_option(option)
    option_actions = {
      1 => -> { @app.list_books },
      2 => -> { @app.list_labels },
      3 => -> { @app.add_book },
      4 => -> { @app.list_music_albums },
      5 => -> { @app.list_all_genres },
      6 => -> { @app.add_album },
      7 => -> { @app.list_all_games },
      8 => -> { @app.list_all_authors },
      9 => -> { @app.add_game },
      10 => -> { @app.exit_app },
      default: -> { puts 'Enter a number appearing in the options above [1 - 10]' }
    }
    action = option_actions[option] || option_options[:default]
    action.call
  end
end
