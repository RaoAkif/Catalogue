require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify, :title

  def initialize(title, genre, publish_date, archived: false, on_spotify: true)
    super(title, publish_date, archived:)
    @on_spotify = on_spotify
    add_genre(genre)
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end

  def to_hash
    { title: @title, genre: @genre, publish_date: @publish_date.strftime('%Y-%m-%d') }
  end
end
