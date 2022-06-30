require_relative 'item'
require_relative 'label'
require 'date'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state, :title

  def initialize(title, publish_date, publisher, cover_state, author, label)
    super(title, publish_date, archived: false)
    @publish_date = DateTime.parse(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    add_author(author)
    @label = label
    add_label(label)
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end

  def to_hash
    { title: @title, publish_date: @publish_date.strftime('%Y-%m-%d'), publisher: @publisher, cover_state: @cover_state,
      author: @author.to_hash, label: @label.to_hash }
  end
end
