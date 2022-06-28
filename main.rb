require_relative 'book'
require_relative 'label'
require_relative 'book_creator'
require_relative 'store'

class Main
  def initialize
    @book_creator = BookCreator.new
    @store = Store.new
    @books = @store.load_books
    @labels = []
  end

  def process_selection(selection) # rubocop:disable Metrics/CyclomaticComplexity
    case selection
    when '1'
      @books.each{|book| puts book.title}
    when '2'
      @labels.each{|label| puts label.title}
    when '3'
      puts "option 3 selected"
    when '4'
      puts "option 4 selected"
    when '5'
      puts "option 5 selected"
    when '6'
      puts "option 6 selected"
    when '7'
      puts "option 7 selected"
    when '8'
      puts "option 8 selected"
    when '9'
      puts @books << @book_creator.create_book
    when '10'
      puts "option 8 selected"
    when '11'
      puts "option 8 selected"
    when '12'
      puts "option 8 selected"
    when '0' then "Have a nice day"
    else
      puts 'Invalid selection'
    end
  end

  def interface
    selection = nil
    until selection == '0'
      puts "Welcome to Catalog App!\n\n"
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all music albums'
      puts '3 - List all movies'
      puts '4 - List all games'
      puts '5 - List all genres'
      puts '6 - List all labels'
      puts '7 - List all authors'
      puts '8 - List all sources'
      puts '9 - Create a book'
      puts '10 - Create a music album'
      puts '11 - Create a movie'
      puts '12 - Create a game'
      puts '0 - Exit'
      selection = gets.chomp.to_s
      process_selection(selection)
    end
    @store.store_books(@books.map{|book| book.to_hash}.to_json)
    puts "Have a great day!"
  end
end

app = Main.new
app.interface