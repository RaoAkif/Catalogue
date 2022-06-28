require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(title, genre, publish_date, archived: false, on_spotify: true)
    super(title, publish_date, archived: archived)
    @on_spotify = on_spotify
    self.add_genre(genre)
  end

  def can_be_archived?
    return true if super && on_spotify
    false
  end
end
