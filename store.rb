require 'json'

class Store
  def store_books(obj)
    File.write('./Data/books_data.json', obj)
  end

  def store_music_albums(obj)
    File.write('./Data/music_albums_data.json', obj)
  end

  def store_games(obj)
    File.write('./Data/games_data.json', obj)
  end

  def load_books
    books_file = File.open('./Data/books_data.json')
    file_data = books_file.read
    return [] if file_data == ''

    JSON.parse(file_data, symbolize_names: true).map do |book|
      Book.new(book[:title], book[:publish_date], book[:publisher], book[:cover_state], book[:author])
    end
  end

  def load_music_albums
    music_albums_file = File.open('./Data/music_albums_data.json')
    file_data = music_albums_file.read
    return [] if file_data == ''

    JSON.parse(file_data, symbolize_names: true).map do |music_album|
      MusicAlbum.new(music_album[:title], music_album[:genre], music_album[:publish_date])
    end
  end

  def load_games
    games_file = File.open('./Data/games_data.json')
    file_data = games_file.read
    return [] if file_data == ''

    JSON.parse(file_data, symbolize_names: true).map do |game|
      Game.new(game[:title], game[:publish_date], game[:last_played_at])
    end
  end
end
