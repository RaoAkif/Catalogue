require_relative 'book'
require_relative 'music_album'
require_relative 'label'
require_relative 'genre'
require_relative 'book_creator'
require_relative 'music_album_creator'
require_relative 'store'
require_relative 'game'
require_relative 'game_creator'
require_relative 'movie'
require_relative 'movie_creator'

class Main
  def initialize
    @store = Store.new
    @book_creator = BookCreator.new
    @books = @store.load_books
    @music_album_creator = MusicAlbumCreator.new
    @music_albums = @store.load_music_albums
    @games = @store.load_games
    @game_creator = GameCreator.new
    @movie_creator = MovieCreator.new
    @movies = @store.load_movies
  end

  def process_selection(selection) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    case selection
    when '1'
      @books.each { |book| puts book.title }
    when '2'
      @music_albums.each { |music_album| puts music_album.title }
    when '3'
      @movies.each { |movie| puts movie.title }
    when '4'
      @games.each { |game| puts game.title }
    when '5'
      [*@music_albums, *@movies].each { |media| puts media.genre.name.to_s }
    when '6'
      @books.each { |book| puts book.label.title }
    when '7'
      @books.each { |book| puts "#{book.author.first_name} #{book.author.last_name}" }
    when '8'
      [*@music_albums, *@movies].each { |media| puts media.source.name.to_s }
    when '9'
      @books << @book_creator.create_book
    when '10'
      @music_albums << @music_album_creator.create_music_album
    when '11'
      @movies << @movie_creator.create_movie
    when '12'
      @games << @game_creator.create_game
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
    @store.store_music_albums(@music_albums.map(&:to_hash).to_json)
    @store.store_games(@games.map(&:to_hash).to_json)
    @store.store_movies(@movies.map(&:to_hash).to_json)
    puts 'Have a great day!'
  end
end

app = Main.new
app.interface
