require_relative 'music_album'

class MusicAlbumCreator
  def create_music_album
    puts 'What is the title of Music Album?'
    title = gets.chomp

    puts 'What is the genre of this Music Album?'
    genre = gets.chomp

    puts 'What did this album was published? (YYYY-MM-DD)'
    publish_date = gets.chomp

    MusicAlbum.new(title, genre, publish_date)
  end
end
