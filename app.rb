require_relative 'all_paths'

class App
  def initialize
    @books = []
    @labels = []
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
    if @labels.empty?
      puts 'No Labels available'
      @labels.each_with_index do |label, index|
        puts "#{index} id: #{label.id} title: \"#{label.title}\" color: #{label.color}"
      end
    end
  end

  def exit_app
    puts 'Thank you for using this App.'
    exit
  end
end
