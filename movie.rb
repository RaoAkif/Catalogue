require_relative 'item'

class Movie < Item
  attr_reader :silent, :title

  def initialize(title, genre, source, publish_date, silent: true)
    super(title, publish_date)
    @silent = silent
    add_genre(genre)
    add_source(source)
  end

  def can_be_archived?
    return true if super && silent

    false
  end

  def to_hash
    { title: @title, genre: @genre.to_hash, source: @source.to_hash, publish_date: @publish_date.strftime('%Y-%m-%d') }
  end
end
