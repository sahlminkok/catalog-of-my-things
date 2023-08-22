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
      break if option == 11
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
    puts '[7] Games Section'
    puts '[8] List all games'
    puts '[9] List all authors'
    puts '[10] Add a game'
    puts ' '
    puts '[11] Exit'
  end
end
