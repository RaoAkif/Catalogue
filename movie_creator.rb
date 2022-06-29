require_relative 'movie'
require_relative 'genre_creator'
require_relative 'source_creator'

class MovieCreator
  def initialize
    @genre_creator = GenreCreator.new
    @source_creator = SourceCreator.new
  end

  def create_movie
    puts 'Type the movie here:'
    title = gets.chomp

    genre = @genre_creator.create_genre

    source = @source_creator.create_source

    puts 'Type the movie date (YYYY-MM-DD) here:'
    publish_date = gets.chomp

    Movie.new(title, genre, source, publish_date)
  end
end
