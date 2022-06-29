require_relative 'game'

class GameCreator
  def create_game
    puts 'Please type the game title'
    title = gets.chomp

    puts 'Please enter the publish date as YYYY-MM-DD'
    publish_date = gets.chomp

    puts 'Please enter the last played date as YYYY-MM-DD'
    last_played_at = gets.chomp

    Game.new(title, publish_date, last_played_at)
  end
end
