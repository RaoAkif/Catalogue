require_relative 'book'
require_relative 'label'
require_relative 'book_creator'
require_relative 'store'

class Main
  def initialize
    @store = Store.new
    @book_creator = BookCreator.new
    @books = @store.load_books
    @music_album_creator = MusicAlbumCreator.new
    @music_albums = @store.load_music_albums
    @labels = []
  end

  def process_selection(selection) # rubocop:disable Metrics/CyclomaticComplexity
    case selection
    when '1'
      @books.each { |book| puts book.title }
    when '2'
      @labels.each { |label| puts label.title }
    when '3'
      puts 'option 3 selected'
    when '4'
      puts 'option 4 selected'
    when '5'
      puts 'option 5 selected'
    when '6'
      puts 'option 6 selected'
    when '7'
      puts 'option 7 selected'
    when '8'
      puts 'option 8 selected'
    when '9'
      @books << @book_creator.create_book
    when '10'
      @music_albums << @music_album_creator.create_music_album
    when '11'
      puts 'option 11 selected'
    when '12'
      puts 'option 12 selected'
    when '0' then 'Have a nice day'
    else
      puts 'Invalid selection'
    end
  end

  def interface
    selection = nil
    options = ['1 - List all books', '2 - List all music albums', '3 - List all movies', '4 - List all games',
               '5 - List all genres', '6 - List all labels', '7 - List all authors', '8 - List all sources',
               '9 - Create a book', '10 - Create a music album', '11 - Create a movie', '12 - Create a game',
               '0 - Exit']
    until selection == '0'
      puts "Welcome to Catalog App!\n\n"
      puts 'Please choose an option by entering a number:'
      options.each { |option| puts option }
      selection = gets.chomp.to_s
      process_selection(selection)
    end
    @store.store_books(@books.map(&:to_hash).to_json)
    puts 'Have a great day!'
  end
end

app = Main.new
app.interface
