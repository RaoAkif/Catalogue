require_relative 'movie'

class MovieCreator
  def create_movie
    puts 'Type the movie here:'
    title = gets.chomp

    puts 'Type the movie genre here:'
    genre = gets.chomp

    puts 'Type the movie source here: (Netflix, Hbo, DisneyPlus)'
    source = gets.chomp

    puts 'Type the movie date (YYYY-MM-DD) here:'
    publish_date = gets.chomp

    Movie.new(title, genre, source, publish_date)
  end  
end
