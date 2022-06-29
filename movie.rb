require_relative 'item'

class Movie < Item
  attr_reader :silent, :title

  def initialize(title, genre, source, publish_date, archived: false, silent: true)
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
    { title: @title, genre: @genre, source: @source, publish_date: @publish_date.strftime('%Y-%m-%d') }
  end

end